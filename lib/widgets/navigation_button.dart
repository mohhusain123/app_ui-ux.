import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Navigation button for quiz (previous/next)
class NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const NavigationButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled
            ? AppColors.primaryColor
            : AppColors.grayColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label),
    );
  }
}
