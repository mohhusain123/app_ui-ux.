import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pengaturan', showBackButton: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notification Settings
          _buildSettingItem(
            title: 'Notifikasi',
            subtitle: 'Aktifkan notifikasi aplikasi',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
              activeThumbColor: AppColors.primary,
            ),
          ),

          // Dark Mode Settings
          _buildSettingItem(
            title: 'Dark Mode',
            subtitle: 'Gunakan tema gelap',
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() => _darkModeEnabled = value);
              },
              activeThumbColor: AppColors.primary,
            ),
          ),

          const Divider(height: 32),

          // App Info
          _buildSettingItem(
            title: 'Versi Aplikasi',
            subtitle: '1.0.0',
            trailing: null,
          ),

          _buildSettingItem(
            title: 'Tentang',
            subtitle: 'Informasi tentang aplikasi LMS',
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Show about dialog
              showAboutDialog(
                context: context,
                applicationName: 'LMS',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 LMS Team',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(title, style: AppTextStyles.bodyText1),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
      ),
      trailing: trailing,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.grey.withOpacity(0.05),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
