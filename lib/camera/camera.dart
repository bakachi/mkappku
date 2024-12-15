import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import '../HomeScreen/HomeScreen.dart';
import '../camera/ImagePreviewPage/ImagePreviewPage.dart';
import '../camera/ImageKlasifikasi/classifier.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final picker = ImagePicker();
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController =
          CameraController(cameras.first, ResolutionPreset.high);
      await _cameraController?.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    }
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final XFile? picture = await _cameraController?.takePicture();
      if (picture != null) {
        setState(() {
          _image = File(picture.path);
        });
        await _navigateToPreviewPage(_image!); // Navigasi ke halaman preview
      }
    }
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _uploadPicture() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      await _navigateToPreviewPage(_image!); // Navigasi ke halaman preview
    }
  }

  // Fungsi navigasi ke halaman ImagePreviewPage
  Future<void> _navigateToPreviewPage(File image) async {
    final classifier = Classifier(); // Classifier untuk klasifikasi
    await classifier.initModel();

    try {
      final classificationResult = await classifier.classifyImage(image);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewPage(
            imageFile: image,
            classificationResult: classificationResult,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      classifier.dispose();
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pratinjau kamera dengan padding bawah
          Positioned.fill(
            child: _isCameraInitialized
                ? Padding(
                    padding:
                        const EdgeInsets.only(bottom: 130), // Beri ruang bawah
                    child: CameraPreview(_cameraController!),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),

          // Tombol clear di pojok kiri atas
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.clear, size: 35, color: Colors.black),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeDiseaseScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),

          // Area untuk ikon kamera dan galeri di bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 25), // Posisi ikon lebih ke atas
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.image, size: 40, color: Colors.black),
                    onPressed: _uploadPicture,
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 65), // Geser sedikit ke kiri
                    child: IconButton(
                      icon: const Icon(Icons.camera,
                          size: 70, color: Colors.black),
                      onPressed: _takePicture,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
