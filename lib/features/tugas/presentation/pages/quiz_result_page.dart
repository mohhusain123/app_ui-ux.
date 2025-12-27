import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Quiz Review 1'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question card
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
                    Text('Soal 3', style: AppTextStyles.headline3),
                    const SizedBox(height: 12),
                    Text(
                      'Apa yang dimaksud dengan User Interface (UI) dalam konteks desain perangkat lunak?',
                      style: AppTextStyles.bodyText1,
                    ),
                    const SizedBox(height: 16),
                    _buildAnswerOption(
                      'A',
                      'Bagian dari sistem operasi',
                      false,
                      false,
                    ),
                    _buildAnswerOption(
                      'B',
                      'Antarmuka antara pengguna dan perangkat lunak',
                      true,
                      false,
                    ),
                    _buildAnswerOption('C', 'Bahasa pemrograman', false, true),
                    _buildAnswerOption(
                      'D',
                      'Proses pengembangan perangkat lunak',
                      false,
                      false,
                    ),
                    _buildAnswerOption(
                      'E',
                      'Alat untuk debugging',
                      false,
                      false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Kembali ke hasil review',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(
    String option,
    String text,
    bool isCorrect,
    bool isWrong,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withOpacity(0.1)
            : isWrong
            ? Colors.red.withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCorrect
              ? Colors.green
              : isWrong
              ? Colors.red
              : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: isCorrect
                ? Colors.green
                : isWrong
                ? Colors.red
                : Colors.grey,
            child: Text(
              option,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppTextStyles.bodyText2)),
          if (isCorrect)
            const Icon(Icons.check_circle, color: Colors.green)
          else if (isWrong)
            const Icon(Icons.cancel, color: Colors.red),
        ],
      ),
    );
  }
}
