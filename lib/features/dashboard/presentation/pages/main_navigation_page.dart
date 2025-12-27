import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'dashboard_page.dart';
import '../../../kelas/presentation/pages/kelas_page.dart';
import '../../../notifikasi/presentation/pages/notifikasi_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const DashboardPage(),
    const KelasPage(),
    const NotifikasiPage(),
    const ProfilePage(),
  ];

  static const List<String> _titles = [
    'Dashboard',
    'Kelas',
    'Notifikasi',
    'Profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _titles[_selectedIndex],
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Kelas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        elevation: 8.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
