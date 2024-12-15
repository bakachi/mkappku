import 'package:flutter/material.dart';
import '../home/home.dart';
import '../camera/camera.dart';
import '../disease/disease.dart';

class HomeDiseaseScreen extends StatefulWidget {
  const HomeDiseaseScreen({super.key});

  @override
  State<HomeDiseaseScreen> createState() => _HomeCameraDiseaseScreenState();
}

class _HomeCameraDiseaseScreenState extends State<HomeDiseaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  bool isCameraSelected = false;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
    controller.addListener(() {
      if (controller.index == 1) {
        setState(() {
          isCameraSelected = true;
        });
      } else {
        setState(() {
          isCameraSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCameraSelected
          ? const CameraPage()
          : TabBarView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                MyHome(),
                CameraPage(),
                BananaDiseasePage(),
              ],
            ),
      bottomNavigationBar: isCameraSelected
          ? null
          : TabBar(
              controller: controller,
              tabs: const <Widget>[
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.camera_alt, size: 30), text: 'Camera'),
                Tab(icon: Icon(Icons.eco), text: 'Banana Disease'),
              ],
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
            ),
    );
  }
}
