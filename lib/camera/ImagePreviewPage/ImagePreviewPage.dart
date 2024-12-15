import 'dart:io';
import 'package:flutter/material.dart';
import '../ImageTips/TipsContainers.dart'; // Import the new file

class ImagePreviewPage extends StatefulWidget {
  final File imageFile;
  final Map<String, dynamic> classificationResult;

  const ImagePreviewPage({
    super.key,
    required this.imageFile,
    required this.classificationResult,
  });

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  @override
  Widget build(BuildContext context) {
    final label = widget.classificationResult["label"] ?? "Unknown";
    final confidence = widget.classificationResult["confidence"] ?? 0.0;
    final predictionTime = widget.classificationResult["predictionTime"] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Prediksi',
          style: TextStyle(
              fontFamily: 'Biryani', fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container 1: Gambar
              _buildImageContainer(widget.imageFile),
              const SizedBox(height: 16.0),

              // Container 2: Hasil Prediksi
              _buildContainer(
                icon: Icons.analytics_outlined,
                title: "Hasil Prediksi",
                content: label,
              ),
              const SizedBox(height: 16.0),

              // Container 3: Tingkat Akurasi
              _buildContainer(
                icon: Icons.bar_chart,
                title: "Tingkat Akurasi",
                content: "${confidence.toStringAsFixed(2)}%",
              ),
              const SizedBox(height: 16.0),
              _buildContainer(
                icon: Icons.speed,
                title: "Kecepatan Prediksi",
                // ignore: unnecessary_brace_in_string_interps
                content: "${predictionTime} ms",
              ),
              const SizedBox(height: 16.0),

              // Container 4: Icon Peringatan dengan Teks
              _buildWarningContainer(),
              const SizedBox(height: 16.0),

              // Use the new function to display Tips
              buildPreventionAndNextBatchTips(label, context),
            ],
          ),
        ),
      ),
    );
  }

  // Container untuk Gambar
  Widget _buildImageContainer(File imageFile) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          imageFile,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Container Umum
  Widget _buildContainer({
    required IconData icon,
    required String title,
    required String content,
    double iconSize = 30.0,
    double fontSize = 14.0,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.black,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize + 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  content,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Container untuk Peringatan
  Widget _buildWarningContainer({
    double iconSize = 64.0,
    double fontSize = 14.0,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.warning,
            size: iconSize,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 8.0),
          Text(
            "Peringatan: Penyakit ini tidak dapat disembuhkan, tetapi penyebarannya dapat dicegah dengan mengikuti panduan berikut.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontStyle: FontStyle.italic,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
