import 'package:flutter/material.dart';

// Data untuk ikon, subjudul, deskripsi, dan poin-poin
final List<Map<String, dynamic>> diseaseData = [
  {
    'icon': Icons.local_florist,
    'subjudul': 'Nama Umum',
    'deskripsi':
        'Penyakit ini disebut "Moko" dan biasa menyerang pisang jenis Cavendish (AAA), menyebabkan daun menguning dan layu. Di Filipina, penyakit yang serupa disebut bugtok dan biasanya menyerang bunga dan buah pisang untuk dimasak (jenis ABB/BBB).'
  },
  {
    'icon': Icons.coronavirus,
    'subjudul': 'Penyebab',
    'deskripsi':
        'Penyakit Moko disebabkan oleh bakteri bernama Ralstonia solanacearum ras 2, biovar 1. Bakteri ini juga menyebabkan penyakit bugtok. Penyakit Moko dan bugtok disebabkan oleh bakteri yang sama, tetapi menunjukkan gejala berbeda pada jenis pisang yang berbeda.'
  },
  {
    'icon': Icons.biotech,
    'subjudul': 'Inang',
    'deskripsi':
        'Penyakit ini menyerang pisang, pisang raja, Heliconia, dan beberapa jenis gulma yang dapat terinfeksi tanpa menunjukkan gejala.'
  },
  {
    'icon': Icons.public,
    'subjudul': 'Distribusi',
    'deskripsi':
        'Penyakit ini ada di banyak daerah seperti Asia, Afrika, Amerika, Karibia, dan sebagian Oseania.'
  },
  {
    'icon': Icons.pest_control,
    'subjudul': 'Gejala & Siklus Hidup',
    'deskripsi':
        'Penyakit Moko membuat daun menguning dan layu, batang serta bunga menunjukkan noda coklat, dan buah tidak matang merata dengan pembusukan coklat atau abu-abu di dalamnya. Infeksi bisa terjadi melalui serangga yang mengunjungi bunga, air irigasi, anakan dari tanaman yang terinfeksi, atau alat yang tidak steril. Bakteri ini dapat bertahan lama di tanah melalui gulma.'
  },
  {
    'icon': Icons.public,
    'subjudul': 'Dampak',
    'deskripsi':
        'Pisang adalah makanan pokok penting, terutama di Afrika, Asia, dan Amerika Latin. Penyakit ini dapat mengurangi hasil panen, terutama di perkebunan pisang raja. Misalnya, di Kolombia, petani terpaksa beralih ke tanaman lain karena produksi pisang raja menurun akibat penyakit Moko.'
  },
  {
    'icon': Icons.manage_accounts,
    'subjudul': 'Deteksi & Inspeksi',
    'deskripsi':
        'Gejala yang bisa dikenali antara lain daun menguning, buah yang tidak matang sempurna dengan bagian dalam kecoklatan, dan garis coklat pada batang, sedangkan untuk pengendalian:',
    'points': [
      'Biosekuriti: Negara yang belum memiliki penyakit ini harus waspada dan mengawasi pengiriman bibit pisang agar tidak membawa penyakit.',
      'Pengendalian Budaya:[1] Pantau gejala Moko secara teratur dan segera buang tanaman yang terinfeksi. [2] Buang bunga jantan setelah buah terbentuk untuk mencegah penyebaran bakteri dan [3] Pastikan alat pemotong steril dengan membersihkannya menggunakan larutan pemutih.',
    ]
  },
  {
    'icon': Icons.image,
    'subjudul': 'Contoh',
    'deskripsi':
        'Berikut merupakan beberapa contoh bagian pisang yang terkena penyakit Moko:',
    'images': [
      'assets/images/Moko_2.jpg', // Path lokal atau URL gambar pertama
      'assets/images/Moko_3.jpg', // Path lokal atau URL gambar kedua
      'assets/images/Moko_4.jpg', // Path lokal atau URL gambar ketiga
    ],
  },
];

class MokoDeskription extends StatelessWidget {
  final int index;
  final double containerHeight;

  const MokoDeskription({
    super.key,
    required this.index,
    required this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final data = diseaseData[index - 1];
    final points = data['points'] as List<String>?;
    final images = data['images'] as List<String>?; // Gambar untuk "Contoh"

    return Container(
      height: containerHeight,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris untuk ikon dan subjudul
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                data['icon'],
                size: 25,
                color: Colors.black,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  data['subjudul'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'BeVietnam',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Tambahan jarak
          // Deskripsi
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 8.0),
            child: Text(
              data['deskripsi'],
              textAlign: TextAlign.justify, // Rata kiri kanan
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'BeVietnam',
              ),
            ),
          ),
          // Poin-poin jika ada
          if (points != null) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: points
                    .asMap()
                    .entries
                    .map((entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            '${entry.key + 1}. ${entry.value}',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'BeVietnam',
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
          // Gambar jika ada dan subjudul adalah "Contoh"
          if (images != null && data['subjudul'] == 'Contoh') ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: images.map((imagePath) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 21.0), // Jarak antar gambar
                    child: Image.asset(
                      imagePath,
                      height: 400, // Sesuaikan tinggi gambar
                      width: 300, // Lebar gambar penuh
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
