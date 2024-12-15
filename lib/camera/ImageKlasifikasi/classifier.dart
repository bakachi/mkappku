import 'dart:io';
import 'package:flutter_tflite/flutter_tflite.dart';

class Classifier {
  // Inisialisasi model TFLite
  Future<void> initModel() async {
    await Tflite.loadModel(
      model: "assets/model_inceptionv3.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  // Fungsi klasifikasi gambar
  Future<Map<String, dynamic>> classifyImage(File imageFile) async {
    final startTime = DateTime.now(); // waktu mulai

    final recognitions = await Tflite.runModelOnImage(
      path: imageFile.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null || recognitions.isEmpty) {
      throw Exception("No recognitions found!");
    }

    // Hitung durasi
    final endTime = DateTime.now(); // Catat waktu selesai
    final duration = endTime.difference(startTime).inMilliseconds;

    // Pastikan label diproses dengan benar
    final label =
        recognitions[0]['label'].toString().trim(); // Hilangkan spasi tambahan
    final confidence = (recognitions[0]['confidence'] * 100);

    return {
      "label": label,
      "confidence": confidence,
      "predictionTime": duration, // Tambahkan waktu prediksi
    };
  }

  // Membersihkan sumber daya
  void dispose() {
    Tflite.close();
  }
}
