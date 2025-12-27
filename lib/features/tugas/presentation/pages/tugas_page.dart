import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/dummy_data.dart';
import '../../../../core/models/assignment_model.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_card.dart';

class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DummyData.assignments.length,
        itemBuilder: (context, index) {
          final assignment = DummyData.assignments[index];
          return CustomCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        assignment.title,
                        style: AppTextStyles.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildStatusChip(assignment.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text(assignment.description, style: AppTextStyles.bodyText2),
                const SizedBox(height: 8),
                Text(
                  'Deadline: ${assignment.deadline.day}/${assignment.deadline.month}/${assignment.deadline.year}',
                  style: AppTextStyles.caption.copyWith(color: Colors.red),
                ),
                if (assignment.status == AssignmentStatus.graded)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Nilai: ${assignment.score}',
                      style: AppTextStyles.bodyText2.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusChip(AssignmentStatus status) {
    String text;
    Color color;

    switch (status) {
      case AssignmentStatus.notSubmitted:
        text = 'Belum Dikumpulkan';
        color = Colors.red;
        break;
      case AssignmentStatus.submitted:
        text = 'Dikumpulkan';
        color = Colors.orange;
        break;
      case AssignmentStatus.graded:
        text = 'Dinilai';
        color = Colors.green;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: AppTextStyles.caption.copyWith(color: color)),
    );
  }
}
