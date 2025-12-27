import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/dummy_data.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.currentUser;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Picture
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(user.name, style: AppTextStyles.headline2),
          Text(
            user.nim,
            style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 32),

          // Profile Info
          _buildProfileItem('Email', user.email),
          _buildProfileItem('NIM', user.nim),
          _buildProfileItem('Nama', user.name),

          const SizedBox(height: 32),

          // Menu Items
          _buildMenuItem(icon: Icons.edit, title: 'Edit Profil', onTap: () {}),
          _buildMenuItem(
            icon: Icons.lock,
            title: 'Ganti Password',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.settings,
            title: 'Pengaturan',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.pengaturan);
            },
          ),

          const SizedBox(height: 32),

          // Logout Button
          CustomButton(
            text: 'Logout',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(value, style: AppTextStyles.bodyText1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: AppTextStyles.bodyText1),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.grey.withOpacity(0.05),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
