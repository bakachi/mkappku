import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1850,
          child: Stack(
            children: [
              Positioned(
                left: 9,
                top: 67,
                child: Text(
                  'Tips & Trik',
                  style: TextStyle(
                      fontFamily: 'Biryani',
                      fontSize: 28,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                left: 9,
                top: 101,
                child: Text(
                  'Menanam Pohon Pisang dari Awal',
                  style: TextStyle(
                      fontFamily: 'Biryani',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),

              // Container pertama
              Positioned(
                left: 20,
                top: 167,
                child: BoxWidget(
                  title: 'Persiapan Lahan',
                  descriptions: [
                    'Pastikan setiap rumpun memiliki 2-3 pohon saja. Ini membantu tanaman pisang berkembang lebih baik dengan cukup ruang dan nutrisi.',
                    'Jika lahan memiliki kemiringan, pastikan tidak lebih dari 45 derajat. Bentuk lahan bertingkat bisa dibuat untuk mencegah erosi, dan kumpulkan sisa daun atau mulsa di sekitar pangkal pohon agar kelembapan tanah tetap terjaga.',
                    'Jika tanah kurang subur, tambahkan pupuk kompos atau pupuk buatan secara berkala. Rekomendasi per tanaman per tahun:',
                    '- ZA: 200',
                    '- TSP: 100',
                    '- KCl: 150 gram',
                    'Bersihkan lahan dari gulma seperti alang-alang. Selanjutnya, buat lubang tanam dengan ukuran 60 x 60 x 50 cm, beri jarak antar lubang 3-4 meter dan masukkan pupuk kandang atau kompos ke dalam lubang sebelum ditanam.',
                  ],
                  height: 430,
                ),
              ),
              // Container kedua dengan jarak 23 dari container pertama
              Positioned(
                left: 20,
                top: 621,
                child: BoxWidget(
                  title: 'Pemilihan dan Penanaman Bibit',
                  descriptions: [
                    'Gunakan bibit dari anakan pisang yang sehat, biasanya diperoleh dari bagian bawah batang utama (bonggol). Sebelum ditanam di lahan, biarkan bibit tumbuh di media tanah campuran pasir selama seminggu hingga berakar. Setelah itu, bibit dipindahkan ke polybag. Setelah 2 bulan, bibit siap ditanam di lubang tanam. Waktu tanam yang ideal adalah saat awal musim hujan, dan tanam satu bibit per lubang.',
                  ],
                  height: 215,
                ),
              ),
              // Container ketiga dengan jarak 23 dari container kedua
              Positioned(
                left: 20,
                top: 859,
                child: BoxWidget(
                  title: 'Pemupukan',
                  descriptions: [
                    'Sebulan setelah tanam, berikan pupuk berupa campuran 250 gram ZA, 100 gram DS, dan 150 gram ZK per tanaman. Ulangi pemupukan ini setiap tiga bulan dan sebaiknya ditaburkan melingkar di sekitar pangkal tanaman.',
                  ],
                  height: 160,
                ),
              ),
              // Container keempat dengan jarak 23 dari container ketiga
              Positioned(
                left: 20,
                top: 1042,
                child: BoxWidget(
                  title: 'Perawatan dan Pemeliharaan Tanaman',
                  descriptions: [
                    'Penjarangan Tunas: Untuk menjaga kualitas buah, lakukan penjarangan dengan memilih anakan pedang. Setiap rumpun hanya memelihara tiga anakan, anakan kedua dari yang pertama, dan anakan ketiga dari yang kedua. Penjarangan dilakukan saat tanaman induk berusia 4-6 bulan.',
                    'Pemotongan Jantung: Potong jantung pisang setelah semua bunga mekar dan mulai muncul buah-buah kecil. Pemotongan ini akan membantu tanaman menghasilkan buah yang lebih besar, meningkatkan hasil panen hingga 2-5%.',
                    'Pencegahan Penyakit: Tanaman pisang rentan terhadap penyakit layu yang disebabkan oleh jamur Fusarium dan bakteri Pseudomonas solanacearum. Penyakit ini bisa menyebar melalui bibit, tanah, air, serangga, dan alat pemangkasan. Cegah penyakit ini dengan:',
                    '- Menanam bibit yang sehat',
                    '- Memberi pupuk secara seimbang',
                    '- Menjaga sanitasi dan drainase lahan',
                    '- Melakukan pemotongan jantung untuk mencegah serangga',
                  ],
                  height: 510,
                ),
              ),
              // Container kelima dengan jarak 23 dari container keempat
              Positioned(
                left: 20,
                top: 1575,
                child: BoxWidget(
                  title: 'Pemanenan',
                  descriptions: [
                    'Pisang dapat dipanen setelah 80 hari di musim kemarau atau 120 hari di musim hujan sejak jantung pisang muncul. Ciri-ciri buah yang siap panen antara lain:',
                    '- Kulitnya lebih cerah',
                    '- Bentuk buah lebih membulat dan tidak bersiku',
                    '- Pastikan buah tidak terluka saat panen agar kualitasnya tetap terjaga.',
                  ],
                  height: 230,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String title;
  final List<String> descriptions;
  final double height;

  const BoxWidget({
    super.key,
    required this.title,
    required this.descriptions,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: height,
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          ..._buildDescriptionWidgets(),
        ],
      ),
    );
  }

  List<Widget> _buildDescriptionWidgets() {
    List<Widget> descriptionWidgets = [];
    int number = 1;

    for (String desc in descriptions) {
      if (desc.startsWith('-')) {
        descriptionWidgets.add(Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            desc,
            style: const TextStyle(fontSize: 12, fontFamily: 'BeVietnam'),
            textAlign: TextAlign.justify,
          ),
        ));
      } else {
        descriptionWidgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              descriptions.length > 1 && !desc.startsWith('-')
                  ? '${number++}.'
                  : '',
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'BeVietnam',
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                desc,
                style: const TextStyle(fontSize: 12, fontFamily: 'BeVietnam'),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ));
      }
      descriptionWidgets.add(const SizedBox(height: 5));
    }

    return descriptionWidgets;
  }
}
