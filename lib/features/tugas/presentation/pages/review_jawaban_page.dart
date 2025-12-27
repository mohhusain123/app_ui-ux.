import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ReviewJawabanPage extends StatelessWidget {
  const ReviewJawabanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Review Jawaban'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quiz info card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quiz: Pengantar User Interface Design',
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tanggal: 27 Desember 2023',
                      style: AppTextStyles.bodyText2,
                    ),
                    Text(
                      'Waktu: 14:00 - 15:30',
                      style: AppTextStyles.bodyText2,
                    ),
                    Text('Durasi: 90 menit', style: AppTextStyles.bodyText2),
                    const SizedBox(height: 8),
                    Text(
                      'Skor: 85/100',
                      style: AppTextStyles.bodyText1.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Daftar Soal', style: AppTextStyles.headline3),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return _buildQuestionItem(index + 1);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Navigate back
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Selesai / Kembali'),
        ),
      ),
    );
  }

  Widget _buildQuestionItem(int number) {
    // Mock data
    String selected = ['A', 'B', 'C', 'D', 'E'][number % 5];
    String correct = 'B';
    bool isCorrect = selected == correct;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          child: Text(
            number.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text('Soal $number', style: AppTextStyles.bodyText2),
        subtitle: Text(
          'Jawaban: $selected | Benar: $correct',
          style: AppTextStyles.caption,
        ),
        trailing: TextButton(
          onPressed: () {
            // Navigate to single question review
          },
          child: Text(
            'Lihat Soal',
            style: AppTextStyles.bodyText2.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
