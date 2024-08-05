import 'package:flutter/material.dart';
import 'package:temu_qanda/models/data_model.dart';

class ServiceSelectScreen extends StatelessWidget {
  final DataModel data;

  const ServiceSelectScreen({super.key, required this.data});

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
              // Image.memory(data.imageBytes), // for test
              const Text(
                '이용할 서비스를',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '선택해주세요!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '유사문제를 추천해줘!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '풀이를 알려줘!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
