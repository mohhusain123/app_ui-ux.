import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class QuizReviewPage extends StatefulWidget {
  const QuizReviewPage({super.key});

  @override
  State<QuizReviewPage> createState() => _QuizReviewPageState();
}

class _QuizReviewPageState extends State<QuizReviewPage> {
  int currentQuestion = 3;
  int totalQuestions = 15;
  String selectedAnswer = '';
  String correctAnswer = 'B';
  List<String> options = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Quiz Review 1'),
        actions: [
          Row(
            children: [
              const Icon(Icons.timer),
              const SizedBox(width: 4),
              Text(
                '15:00',
                style: AppTextStyles.bodyText2.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalQuestions,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < currentQuestion ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Soal Nomor $currentQuestion / $totalQuestions',
                style: AppTextStyles.bodyText2,
              ),
            ),
            const SizedBox(height: 24),
            // Question card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Apa yang dimaksud dengan User Interface (UI) dalam konteks desain perangkat lunak?',
                  style: AppTextStyles.bodyText1,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Answer options
            ...options.map((option) => _buildAnswerOption(option)),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to next
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildAnswerOption(String option) {
    bool isSelected = selectedAnswer == option;
    bool isCorrect = option == correctAnswer;
    bool isWrong = isSelected && !isCorrect;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: isCorrect
          ? Colors.green.withOpacity(0.1)
          : isWrong
          ? Colors.red.withOpacity(0.1)
          : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCorrect
              ? Colors.green
              : isWrong
              ? Colors.red
              : Colors.grey,
          child: Text(option, style: const TextStyle(color: Colors.white)),
        ),
        title: Text(_getOptionText(option), style: AppTextStyles.bodyText2),
        onTap: () {
          setState(() {
            selectedAnswer = option;
          });
        },
      ),
    );
  }

  String _getOptionText(String option) {
    switch (option) {
      case 'A':
        return 'Bagian dari sistem operasi';
      case 'B':
        return 'Antarmuka antara pengguna dan perangkat lunak';
      case 'C':
        return 'Bahasa pemrograman';
      case 'D':
        return 'Proses pengembangan perangkat lunak';
      case 'E':
        return 'Alat untuk debugging';
      default:
        return '';
    }
  }
}
