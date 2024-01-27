import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:http/retry.dart';
import 'package:http_parser/http_parser.dart';
import 'package:isolate_image_compress/isolate_image_compress.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';


class BackendServices {
  Future<String> changeOrderStatus({File? file}) async {
    // try {
    var urlString = "https://api.ocr.space/parse/image";
    var url = Uri.parse(urlString);

    final _image = IsolateImage.path(file!.path);
    print('isolate_image_compress begin - : ${_image.data!.length}');
    final _data = await _image.compress(maxSize: 1 * 1024 * 1024); // 1 MB
    print('isolate_image_compress end - : ${_data!.length}');

    // Use the temporary directory for storing compressed file
    String tempDir = (await getTemporaryDirectory()).path;
    File compressedFile = File('$tempDir/compressed_image.jpg');
    await compressedFile.writeAsBytes(_data);

    dio.Dio dioClient = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({
      'image': await dio.MultipartFile.fromFile(
        compressedFile.path,
        filename: basename(compressedFile.path),
        contentType: MediaType('image', 'jpeg'),
      ),
    });

    print("Sending request to $urlString");
    final response = await dioClient.post(
      url.toString(),
      data: formData,
      options: dio.Options(
        headers: {
          "apikey": "K88979378988957",
        },
      ),
    );

    // print("Done request to ${response}");

    if (response.statusCode == 200) {
      var jsonResponse = response.data;

      String parsedText = jsonResponse['ParsedResults'][0]['ParsedText'];

      return parsedText;
    } else {
      return "Error";
    }
    // Handle other exceptions if needed
  }
}
