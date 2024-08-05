import 'dart:typed_data';

class DataModel {
  final Uint8List imageBytes;
  String resultImageUrl;

  DataModel({
    required this.imageBytes,
    required this.resultImageUrl,
  });
}
