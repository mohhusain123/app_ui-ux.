import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import 'dashboard_page.dart';
import '../../../kelas/presentation/pages/kelas_page.dart';
import '../../../tugas/presentation/pages/tugas_page.dart';
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
    const TugasPage(),
    const NotifikasiPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Kelas'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tugas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.ia);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.smart_toy),
      ),
    );
  }
}
