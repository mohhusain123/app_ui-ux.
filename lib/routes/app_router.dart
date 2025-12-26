import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/dashboard/presentation/pages/main_navigation_page.dart';
import '../features/ia/presentation/pages/ia_page.dart';
import '../features/profile/presentation/pages/pengaturan_page.dart';
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
      case AppRoutes.ia:
        return MaterialPageRoute(builder: (_) => const IaPage());
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
