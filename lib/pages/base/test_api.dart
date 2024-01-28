import 'package:ecociel/services/backend_services.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PhotoCaptureScreen extends StatefulWidget {
  @override
  _PhotoCaptureScreenState createState() => _PhotoCaptureScreenState();
}

class _PhotoCaptureScreenState extends State<PhotoCaptureScreen> {
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  String ocrResult = "";
  Future<void> _sendPhoto() async {
    if (_imageFile != null) {
      // Add your JSON data if needed
      // Map<String, dynamic> jsonMap = {"key": "value"};

      // Call the addItem function from BackendServices
      BackendServices backendServices = BackendServices();
      String result = await backendServices.changeOrderStatus(file: _imageFile);
      if (result == "Error") {
        print("Error somewhere");
      }
      setState(() {
        ocrResult = result;
      });
      print("Result: $result");
    } else {
      // No image selected
      print("Please take a photo first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Click'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageFile == null
                  ? Text('Click a photo of bill/ticket/proof ')
                  : Image.file(_imageFile!),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Set the background color to black
                  elevation: 5, // Set the elevation (shadow) for the button
                ),
                onPressed: _takePhoto,
                child: txt('Take Photo', color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Set the background color to black
                  elevation: 5, // Set the elevation (shadow) for the button
                ),
                onPressed: _sendPhoto,
                child: txt('Send to verify', color: Colors.white),
              ),
              ocrResult != ""
                  ? txt(
                      "Photo Could Not be verified",
                      color: Colors.red,
                      size: 20,
                      weight: FontWeight.w700,
                    )
                  : Container(),
              ocrResult != ""
                  ? txt(
                      "Ocr Result",
                      // color: Colors.bla,
                      size: 18,
                      weight: FontWeight.w600,
                    )
                  : Container(),
              ocrResult != ""
                  ? Divider(
                      color: Colors.black,
                    )
                  : Container(),
              ocrResult != ""
                  ? txt(
                      ocrResult,
                      size: 18,
                      weight: FontWeight.w400,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
