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

  Future<Map<String, dynamic>> getUVIndexandWeatherData(
      String lat, String lon, String month) async {
    try {
      var urlStringForCurrentWeather =
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=bca8c048e93a78d8bdacdd36bbee9444";
      var url = Uri.parse(urlStringForCurrentWeather);
      dio.Dio dioClient = dio.Dio();
      final resp = await dioClient.get(url.toString());
      Map<String, dynamic> parsedCurrentWeatherData = resp.data;
      var openUVDataurl =
          "https://api.openuv.io/api/v1/uv?lat=28.65&lng=77.17&alt=100&dt=";
      final response = await dioClient.get(openUVDataurl,
          options: dio.Options(
            headers: {"x-access-token": "openuv-bytfqeorlrwfva24-io"},
          ));
      Map<String, dynamic> parsedUVData = response.data;
      // try {
      // var urlStringForHistoryWeather =
      //     "https://history.openweathermap.org/data/2.5/aggregated/month?lat={$lat}&lon={$lon}&month={$month}&units=metric&appid=41bca8d01ca81fb04f760a9d65ea772d";

      // final resp2 = await dioClient.get(urlStringForHistoryWeather);
      // //   print("ParsedUV:  ${resp2.statusCode}");
      // final parsedHistoryWeatherData = resp2.data;
      // } catch (e) {
      //   print(e);
      // }
      return {
        "currentTemp": parsedCurrentWeatherData["main"]["temp"] - 273.15,
        "currentHumidity": parsedCurrentWeatherData["main"]["humidity"],
        "currentPressure": parsedCurrentWeatherData["main"]["pressure"],
        "currentClouds": parsedCurrentWeatherData["clouds"],
        "uvdata": parsedUVData["result"]["uv"],
        "uvdataskintime": parsedUVData["result"]["safe_exposure_time"]["st1"],
        "historicaltemp": parsedCurrentWeatherData["main"]["temp"] - 275.15,
      };
    } catch (e) {
      // Handle the error as needed, you might want to return a default value or throw an exception.
      return {
        "currentTemp": 0.0,
        "currentHumidity": 0,
        "currentPressure": 0,
        "currentClouds": 0,
        "uvdata": 0,
        "uvdataskintime": 0,
      };
    }
  }
}
