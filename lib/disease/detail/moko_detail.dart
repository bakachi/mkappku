import 'package:flutter/material.dart';
import './deskription/moko_deskription.dart'; // Mengimpor file fusarium_description.dart

class DiseaseDetailMoko extends StatelessWidget {
  const DiseaseDetailMoko({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar ukuran untuk setiap kontainer
    final List<double> containerHeights = [
      200, // Ukuran untuk gambar
      180,
      180,
      123,
      110,
      230,
      190,
      365,
      1378,
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Gambar di bagian atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              './assets/images/Rectangle 51.png',
              width: MediaQuery.of(context).size.width,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          // Konten Utama dengan scroll
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                // AppBar dengan ikon kembali dan judul
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: const Text(
                    'Penyakit Moko',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Biryani',
                    ),
                  ),
                  centerTitle: true,
                ),
                // Konten scrollable
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: containerHeights
                          .length, // Menggunakan panjang daftar ukuran
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Kontainer pertama dengan gambar
                          return Container(
                            height: containerHeights[index],
                            margin: const EdgeInsets.only(bottom: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(
                                    './assets/images/Moko_1.jpg'), // Ganti dengan gambar yang diinginkan
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          // Kontainer untuk deskripsi dan ikon
                          return MokoDeskription(
                            index: index,
                            containerHeight: containerHeights[
                                index], // Mengoper tinggi ke kontainer deskripsi
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
