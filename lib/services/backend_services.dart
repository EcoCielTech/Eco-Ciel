import 'dart:convert';
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

  Future<Map<String, String>> getUVIndexandWeatherData(
      String lat, String lon, String month) async {
    var urlStringForCurrentWeather =
        "https://api.openweathermap.org/data/3.0/onecall?lat={$lat}&lon={$lon}&units=metric&appid=41bca8d01ca81fb04f760a9d65ea772d";

    dio.Dio dioClient = dio.Dio();
    final resp = await dioClient.get(urlStringForCurrentWeather);
    final parsedCurrentWeatherData = json.decode(resp.data);

    var openUVDataurl =
        "https://api.openuv.io/api/v1/uv?lat=28.65&lng=77.17&alt=100&dt=";

    final response = await dioClient.get(openUVDataurl,
        options: dio.Options(
          headers: {"x-access-token": "openuv-bytfqeorlrwfva24-io"},
        ));

    final parsedUVData = json.decode(response.data);

    var urlStringForHistoryWeather =
        "https://history.openweathermap.org/data/2.5/aggregated/month?lat={$lat}&lon={$lon}&month={$month}&units=metric&appid=41bca8d01ca81fb04f760a9d65ea772d";

    final resp2 = await dioClient.get(urlStringForHistoryWeather);
    final parsedHistoryWeatherData = json.decode(resp2.data);

    return {
      "currentTemp": parsedCurrentWeatherData["current"]["temp"],
      "currentHumidity": parsedCurrentWeatherData["current"]["humidity"],
      "currentPressure": parsedCurrentWeatherData["current"]["pressure"],
      "currentClouds": parsedCurrentWeatherData["current"]["clouds"],
      "uvdata": parsedUVData["result"]["uv"],
      "uvdataskintime": parsedUVData["result"]["safe_exposure_time"]["st1"],
      "historicaltemp": parsedHistoryWeatherData["result"]["temp"]["mean"]
    };
  }
}
