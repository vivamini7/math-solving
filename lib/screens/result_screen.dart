import 'package:flutter/material.dart';
import 'package:temu_qanda/models/data_model.dart';

class ResultScreen extends StatelessWidget {
  final DataModel data;

  const ResultScreen({super.key, required this.data});

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
              Image.memory(data.imageBytes),
              const SizedBox(
                height: 50,
              ),
              Image.network(data.resultImageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
