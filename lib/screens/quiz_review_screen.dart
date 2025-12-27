import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/question_card.dart';
import '../widgets/option_tile.dart';
import '../widgets/progress_indicator.dart';
import '../widgets/navigation_button.dart';

// Main quiz review screen
class QuizReviewScreen extends StatefulWidget {
  const QuizReviewScreen({super.key});

  @override
  State<QuizReviewScreen> createState() => _QuizReviewScreenState();
}

class _QuizReviewScreenState extends State<QuizReviewScreen> {
  int currentQuestion = 1;
  final int totalQuestions = 10;
  String selectedOption = '';
  List<String> questionStatuses = [
    'correct',
    'wrong',
    'unanswered',
    'correct',
    'wrong',
    'unanswered',
    'correct',
    'wrong',
    'unanswered',
    'unanswered',
  ];

  final String question =
      'Apa yang dimaksud dengan User Interface (UI) dalam konteks desain perangkat lunak?';
  final List<Map<String, String>> options = [
    {'option': 'A', 'text': 'Bagian dari sistem operasi'},
    {'option': 'B', 'text': 'Antarmuka antara pengguna dan perangkat lunak'},
    {'option': 'C', 'text': 'Bahasa pemrograman'},
    {'option': 'D', 'text': 'Proses pengembangan perangkat lunak'},
    {'option': 'E', 'text': 'Alat untuk debugging'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white),
                const SizedBox(width: 4),
                const Text('15:00', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Progress indicator
            QuizProgressIndicator(
              currentQuestion: currentQuestion,
              totalQuestions: totalQuestions,
              questionStatuses: questionStatuses,
            ),
            const SizedBox(height: 24),
            // Question card
            QuestionCard(question: question),
            const SizedBox(height: 24),
            // Options
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: OptionTile(
                  option: option['option']!,
                  text: option['text']!,
                  isSelected: selectedOption == option['option'],
                  onTap: () {
                    setState(() {
                      selectedOption = option['option']!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  label: 'Soal Sebelumnya',
                  isEnabled: currentQuestion > 1,
                  onPressed: currentQuestion > 1
                      ? () {
                          setState(() {
                            currentQuestion--;
                          });
                        }
                      : null,
                ),
                NavigationButton(
                  label: 'Soal Selanjutnya',
                  isEnabled: currentQuestion < totalQuestions,
                  onPressed: currentQuestion < totalQuestions
                      ? () {
                          setState(() {
                            currentQuestion++;
                            selectedOption = '';
                          });
                        }
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
