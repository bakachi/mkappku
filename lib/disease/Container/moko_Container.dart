// ignore: file_names
import 'package:flutter/material.dart';
import '../detail/moko_detail.dart';

class MokoContainer extends StatelessWidget {
  const MokoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Sudut gambar
            child: Image.asset(
              './assets/images/Moko_1.jpg', // Path gambar pertama
              width: 100,
              height: 215,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0), // Menurunkan posisi judul
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul sedikit turun dari kontainer
                  const Center(
                    child: Text(
                      'Penyakit Moko',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          12), // Memberikan jarak tambahan antara judul dan penjelasan
                  // Penjelasan sedikit bergeser ke kiri
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 6.0), // Menggeser penjelasan ke kiri
                    child: Text(
                      'Disebabkan oleh bakteri (Ralstonia solanacearum) yang menyerang',
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Lihat lebih banyak di kanan bawah
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiseaseDetailMoko(),
                          ),
                        );
                      },
                      child: const Text('Lihat lebih banyak'),
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
