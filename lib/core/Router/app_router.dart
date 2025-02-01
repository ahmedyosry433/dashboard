import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // final argument = settings.arguments;
    switch (settings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(' No Route Defined For ${settings.name}'),
            ),
          ),
        );
    }
  }
}
