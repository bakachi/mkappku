import 'package:flutter/material.dart';

// Container with List Items
Widget buildContainerWithList({
  required IconData icon,
  required String title,
  required List<String> listItems,
  bool includeSubPoints = true, // Flag to include or exclude sub-points
  double iconSize = 30.0,
  double pointFontSize = 14.0,
  String pointFontFamily = 'BeVietnam', // Default font for points
  double subPointFontSize = 12.0,
  String subPointFontFamily = 'BeVietnam', // Default font for sub-points
  double lineSpacing = 1.5, // Default line spacing multiplier
}) {
  int mainPointIndex = 0; // Initialize main point index

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
          color: Colors.green,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0, // Fixed font size for title
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  final isSubPoint = listItems[index].startsWith("-");

                  // Skip sub-points if includeSubPoints is false
                  if (!includeSubPoints && isSubPoint) return const SizedBox();

                  // If it's a main point, increment the mainPointIndex
                  if (!isSubPoint) {
                    mainPointIndex++;
                  }

                  return Padding(
                    padding: EdgeInsets.only(
                      left: isSubPoint ? 20.0 : 0, // Indentation for sub-points
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isSubPoint)
                          Text(
                            '$mainPointIndex.', // Adjusted numbering for main points
                            style: TextStyle(
                              fontSize: pointFontSize,
                              fontFamily: pointFontFamily,
                            ),
                          ),
                        if (!isSubPoint)
                          const SizedBox(
                              width:
                                  8.0), // Space between the number and the text
                        Expanded(
                          child: Text(
                            listItems[index],
                            style: TextStyle(
                              fontSize:
                                  isSubPoint ? subPointFontSize : pointFontSize,
                              fontFamily: isSubPoint
                                  ? subPointFontFamily
                                  : pointFontFamily,
                              height: lineSpacing, // Line spacing applied here
                            ),
                            textAlign:
                                TextAlign.justify, // Align text to justify
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Predefined Tips for Prevention and Next Batch
final preventionTips = {
  "Moko Disease": [
    "Monitor:",
    "- pantau kebun secara rutin untuk mendeteksi gejala penyakit moko",
    "Penaganan:",
    "- Hancurkan tanaman yang sakit dengan berbisida atau potong batang dipermukaan tanah, lalu kubur atau dibakar",
    "- Bungkus bunga (jantung pisang) dengan kantong khusus, dan buang setelah buah terbentuk",
    "- Segera buang bunga jantan setelah tandan terakhir muncul",
    "Kebersihan:",
    "- Bersihkan alat dan mesin yang digunakan dengan pemutih (3% natrium hipoklorit)",
    "- Batasi akses pengunjung/ pekerja ke area yang sudah terinfeksi",
    "- Isolasi rumpun yang terkena penyakit dengan cara mengali saluran di sekelilingnya"
  ],
  "Fusarium Disease": [
    "Hindari penggunaan berbagai mesin dan peralatan pertanian dari petani lain, kemudian bersihkan alat dan kendaraa sebelum amsuk ke lahan",
    "Jika tanaman sudah terinfeksi: ",
    "- Cabut tanaman beserta akar dan anakannya, kemudian baar di temapat atau gunakan herbisida",
    "- Pertimbangkan untuk menghapus tanaman disekitarnya jika ada kemungkinan penyakit menyebar melalui akar",
    "- Isolasi rumpun yang terinfeksi dan bersihkan alat dengan pemutih",
    "- Gali drainase untuk mengalihkan aliran air permukaan di area yang terinfeksi",
    "- Jangan menanam Kembali varietas rentan di area yang telah terinfeksi"
  ],
};

final nextBatchTips = {
  "Moko Disease": [
    "Jika segala tindakan sebelumnya gagal untuk mengendalikan penyakit, biarkan lahan beristirahat (tidak menanam) atau ganti dengan tanaman alternatif, seperti tomat",
    "jika tidakan pencegahan sebelumnya berhasil, Gunakan bibit yang sehat atau bersertifikat dan jangan menanam didekat lahan yang terkena penyakit, serta tidak menaman pisang dengan cara tumpang sari",
  ],
  "Fusarium Disease": [
    "Gunakan varietas tahan penyakit dan lanjutkan langkah pencegahan untuk menghindari penyebaran lebih lanjut.",
    "Jangan gunakan anakan dari tanaman induk yang menunjukan gejala penyakit, meskipun anakan tampak sehat",
    "Gunakan bahan tanaman yang bersih, disarankan yang bersertifikat bebas penyakit atau dari lahan yang tidak terinfeksi",
  ],
};

// Function to build the tips containers for Prevention
Widget buildPreventionTips(String label, BuildContext context) {
  final tipsPrevention = preventionTips[label] ?? [];

  return buildContainerWithList(
    icon: Icons.health_and_safety,
    title: "Tips Penanganan",
    listItems: tipsPrevention,
    pointFontSize: 12.0,
    pointFontFamily: 'BeVietnam', // Font family for points
    subPointFontSize: 12.0,
    subPointFontFamily: 'BeVietnam', // Font family for sub-points
  );
}

// Function to build the tips containers for Next Batch
Widget buildNextBatchTips(String label, BuildContext context) {
  final tipsNextBatch = nextBatchTips[label] ?? [];

  return buildContainerWithList(
    icon: Icons.lightbulb_outline,
    title: "Tips Batch Berikutnya",
    listItems: tipsNextBatch,
    includeSubPoints: false, // Exclude sub-points for the second container
    pointFontSize: 12.0,
    pointFontFamily: 'BeVietnam',
    subPointFontSize: 12.0,
    subPointFontFamily: 'BeVietnam',
  );
}

// Function to build both prevention and next batch tips
Widget buildPreventionAndNextBatchTips(String label, BuildContext context) {
  return Column(
    children: [
      buildPreventionTips(label, context),
      const SizedBox(height: 16.0),
      buildNextBatchTips(label, context),
    ],
  );
}
