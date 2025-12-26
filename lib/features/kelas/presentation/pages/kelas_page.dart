import 'package:flutter/material.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/dummy_data.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_card.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Kelas'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DummyData.classes.length,
        itemBuilder: (context, index) {
          final classItem = DummyData.classes[index];
          return CustomCard(
            margin: const EdgeInsets.only(bottom: 12),
            onTap: () {
              // Navigate to detail kelas
            },
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.school, color: Colors.blue, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classItem.name,
                        style: AppTextStyles.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        classItem.lecturer,
                        style: AppTextStyles.bodyText2.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${classItem.progress}% progress',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
