import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temu_qanda/models/data_model.dart';
import 'package:temu_qanda/screens/service_select_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  Uint8List? imageBytes;
  String resultImageUrl = '';

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        imageBytes = bytes;
        resultImageUrl = ''; // 이전 결과 이미지 URL 초기화
      });

      DataModel data = DataModel(
        imageBytes: imageBytes!,
        resultImageUrl: resultImageUrl,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceSelectScreen(data: data),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '문제 이미지를',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '올려주세요!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: uploadImage,
                child: const Icon(
                  Icons.file_upload_outlined,
                  size: 100,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
