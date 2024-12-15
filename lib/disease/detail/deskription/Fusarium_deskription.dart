import 'package:flutter/material.dart';

// Data untuk ikon, subjudul, deskripsi, dan poin-poin
final List<Map<String, dynamic>> diseaseData = [
  {
    'icon': Icons.local_florist,
    'subjudul': 'Nama Umum',
    'deskripsi': 'Penyakit Panama atau layu Fusarium pada pisang.'
  },
  {
    'icon': Icons.coronavirus,
    'subjudul': 'Penyebab',
    'deskripsi': 'Disebabkan oleh Fusarium oxysporum f.sp. cubense.'
  },
  {
    'icon': Icons.biotech,
    'subjudul': 'Inang',
    'deskripsi': 'Spesies Musa (pisang) dan Heliconia'
  },
  {
    'icon': Icons.public,
    'subjudul': 'Distribusi',
    'deskripsi':
        'Layu Fusarium kemungkinan berasal dari Asia Tenggara dan pertama kali dilaporkan di Australia tahun 1876. Saat ini tersebar di sebagian besar Asia, Afrika, dan Amerika, termasuk Kepulauan Pasifik. Strain agresif yang disebut Tropical Race 4 (TR4) muncul pada 1990-an dan menginfeksi varietas Cavendish. Sejak 2010, TR4 telah menyebar ke Afrika, Timur Tengah, Asia Selatan dan Tenggara, serta Amerika Selatan.'
  },
  {
    'icon': Icons.pest_control,
    'subjudul': 'Gejala & Siklus Hidup',
    'deskripsi':
        'Terdapat empat ras jamur ini, termasuk TR4 yang menginfeksi banyak varietas, termasuk Cavendish. Jamur masuk melalui akar halus pisang, menyebar di jaringan pengangkut air, menghasilkan spora yang menyumbat aliran air sehingga tanaman layu. Gejala awalnya daun tua menguning di tepinya, lalu coklat, kering, dan runtuh. Jaringan batang berubah warna menjadi coklat atau merah. Penyebaran bisa melalui kontak akar atau peralatan yang terkontaminasi.'
  },
  {
    'icon': Icons.public,
    'subjudul': 'Dampak',
    'deskripsi':
        'Pada 1950-an, Race 1 menghancurkan industri ekspor pisang Gros Michel, memaksa peralihan ke Cavendish. TR4 mengancam 80% produksi global, berpotensi menghancurkan produksi dan memengaruhi ekonomi serta keamanan pangan jutaan petani kecil.'
  },
  {
    'icon': Icons.manage_accounts,
    'subjudul': 'Deteksi & Inspeksi',
    'deskripsi':
        'Penyakit ini sangat sulit diatasi karena jamur bisa bertahan lama di tanah. Beberapa cara yang dapat dilakukan petani untuk mencegah agar penyakit tidak masuk adalah:',
    'points': [
      'Periksa kebersihan alat, kendaraan, dan sepatu sebelum masuk kebun.',
      'Gunakan bibit bebas penyakit atau hasil kultur jaringan yang bersih.',
      'Cabut tanaman yang terinfeksi bersama akar, lalu bakar di tempat.',
      'Gunakan herbisida jika perlu agar tanaman cepat mati.',
      'Jangan tanam kembali di tanah yang pernah terserang Fusarium.',
      'Cuci dan sterilkan peralatan setelah bekerja di kebun.'
    ]
  },
  {
    'icon': Icons.image,
    'subjudul': 'Contoh',
    'deskripsi':
        'Berikut merupakan beberapa contoh bagian pisang yang terkena penyakit Fusarium:',
    'images': [
      'assets/images/Fusarium_1.jpg', // Path lokal atau URL gambar pertama
      'assets/images/Fusarium_3.jpg', // Path lokal atau URL gambar kedua
      'assets/images/Fusarium_4.jpg', // Path lokal atau URL gambar ketiga
    ],
  },
];

class FusariumDeskription extends StatelessWidget {
  final int index;
  final double containerHeight;

  const FusariumDeskription({
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
