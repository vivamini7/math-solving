import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temu_qanda/models/data_model.dart';
import 'package:temu_qanda/widgets/latex_text_widget.dart';

class ResultScreen extends StatefulWidget {
  final DataModel data;

  const ResultScreen({super.key, required this.data});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    uploadImage();
  }

  Future<void> uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://127.0.0.1:5000 /process_image'),
      );

      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          widget.data.imageBytes,
          filename: 'uploaded_image.png',
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        final Map<String, dynamic> data = jsonDecode(responseData.body);
        setState(() {
          widget.data.chapter = data['chapter'];
          widget.data.similarProblem = data['similar_problem'];
          widget.data.explanation = data['explanation'];
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: _isLoading ? false : true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Image.memory(widget.data.imageBytes),
              const SizedBox(
                height: 50,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView(
                        children: [
                          const Text(
                            '[단원]',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.data.chapter,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            '[문제 해설]',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LaTeXText(widget.data.explanation),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            '[유사 문제]',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LaTeXText(widget.data.similarProblem),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
