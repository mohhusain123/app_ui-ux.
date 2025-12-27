import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Custom progress indicator for quiz questions
class QuizProgressIndicator extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final List<String> questionStatuses; // 'correct', 'wrong', 'unanswered'

  const QuizProgressIndicator({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.questionStatuses,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalQuestions,
        (index) => Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getColor(index),
            border: index == currentQuestion - 1
                ? Border.all(color: Colors.black, width: 2)
                : null,
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    if (index >= questionStatuses.length) return AppColors.grayColor;
    switch (questionStatuses[index]) {
      case 'correct':
        return AppColors.successColor;
      case 'wrong':
        return AppColors.errorColor;
      default:
        return AppColors.grayColor;
    }
  }
}
