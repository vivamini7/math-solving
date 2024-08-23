import 'dart:typed_data';

class DataModel {
  final Uint8List imageBytes;
  String chapter = '';
  String similarProblem = '';
  String explanation = '';

  DataModel({
    required this.imageBytes,
  });
}
