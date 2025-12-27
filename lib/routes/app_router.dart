import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';

import '../features/dashboard/presentation/pages/main_navigation_page.dart';

import '../features/ia/presentation/pages/ia_page.dart';

import '../features/kelas/presentation/pages/kelas_page.dart';
import '../features/kelas/presentation/pages/course_detail_page.dart';

import '../features/notifikasi/presentation/pages/notifikasi_page.dart';

import '../features/profile/presentation/pages/pengaturan_page.dart';

import '../features/tugas/presentation/pages/tugas_page.dart';
import '../features/tugas/presentation/pages/upload_page.dart';
import '../features/tugas/presentation/pages/quiz_review_page.dart';
import '../features/tugas/presentation/pages/review_jawaban_page.dart';
import '../features/tugas/presentation/pages/quiz_result_page.dart';
import '../features/tugas/presentation/pages/jadwal_page.dart';

import '../features/profile/presentation/pages/profile_page.dart';

import '../screens/video_detail_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const MainNavigationPage());

      case AppRoutes.kelas:
        return MaterialPageRoute(builder: (_) => const KelasPage());

      case AppRoutes.detailKelas:
        return MaterialPageRoute(builder: (_) => const CourseDetailPage());

      case AppRoutes.tugas:
        return MaterialPageRoute(builder: (_) => const TugasPage());

      case AppRoutes.jadwal:
        return MaterialPageRoute(builder: (_) => const JadwalPage());

      case AppRoutes.notifikasi:
        return MaterialPageRoute(builder: (_) => const NotifikasiPage());

      case AppRoutes.upload:
        return MaterialPageRoute(builder: (_) => const UploadPage());

      case AppRoutes.quizReview:
        return MaterialPageRoute(builder: (_) => const QuizReviewPage());

      case AppRoutes.reviewJawaban:
        return MaterialPageRoute(builder: (_) => const ReviewJawabanPage());

      case AppRoutes.quizResult:
        return MaterialPageRoute(builder: (_) => const QuizResultPage());

      case AppRoutes.videoDetail:
        return MaterialPageRoute(builder: (_) => const VideoDetailScreen());

      case AppRoutes.ia:
        return MaterialPageRoute(builder: (_) => const IaPage());

      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      case AppRoutes.pengaturan:
        return MaterialPageRoute(builder: (_) => const PengaturanPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
