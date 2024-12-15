import 'package:flutter/material.dart';
import 'Container/moko_Container.dart';
import 'Container/fusarium_Container.dart';

class BananaDiseasePage extends StatelessWidget {
  const BananaDiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Menempatkan gambar utama sebagai latar belakang
          Positioned(
            left: -4,
            top: 0,
            child: Image.asset(
              './assets/images/disease.png',
              width: 174,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          // Posisi judul di atas gambar
          const Positioned(
            left: 100, // Mengatur posisi judul agar sesuai dengan gambar
            top: 75, // Menempatkan judul di atas gambar
            child: Text(
              'Penyakit Pisang',
              style: TextStyle(
                fontFamily: 'Biryani',
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          // Elemen-elemen lainnya tetap pada posisinya
          Positioned(
            left: 340,
            top: -13,
            child: Image.asset(
              './assets/images/Vector_2.png',
              width: 70,
              height: 72,
            ),
          ),
          Positioned(
            left: 285,
            top: 35,
            child: Image.asset(
              './assets/images/Vector_1.png',
              width: 43,
              height: 47,
            ),
          ),
          Positioned(
            left: -1,
            top: 600,
            child: Image.asset(
              './assets/images/Vector_3.png',
              width: 415,
              height: 276,
            ),
          ),
          Positioned(
            left: 250,
            top: 260,
            child: Image.asset(
              './assets/images/Vector_4.png',
              width: 238.76,
              height: 202.36,
            ),
          ),
          // Menampilkan kontainer-kontainer penyakit di bawah gambar dan judul
          const Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                MokoContainer(),
                FusariumContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
