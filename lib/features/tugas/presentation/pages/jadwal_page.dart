import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildScheduleItem(
            '08:00 - 09:30',
            'Pemrograman Mobile Lanjutan',
            'Kuliah',
            'Ruang 301',
          ),
          _buildScheduleItem(
            '10:00 - 11:30',
            'Basis Data Terstruktur',
            'Praktikum',
            'Lab Komputer 1',
          ),
          _buildScheduleItem(
            '13:00 - 14:30',
            'Jaringan Komputer',
            'Kuliah',
            'Ruang 205',
          ),
          _buildScheduleItem(
            '15:00 - 16:30',
            'User Interface Design',
            'Kuliah',
            'Ruang 102',
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(
    String time,
    String subject,
    String type,
    String room,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              child: Text(
                time,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: AppTextStyles.bodyText2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.class_, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        type,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        room,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
