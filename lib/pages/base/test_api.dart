import 'package:ecociel/services/backend_services.dart';
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
        title: Text('Photo Capture Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile == null
                ? Text('No photo taken yet')
                : Image.file(_imageFile!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePhoto,
              child: Text('Take Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendPhoto,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
