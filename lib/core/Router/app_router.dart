import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/features/invoices/presentation/view/invesment_screen.dart';
import 'package:admin_dashboard/features/wallet/presentation/view/wallet_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // final argument = settings.arguments;
    switch (settings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case Routes.investmentScreen:
        return MaterialPageRoute(
          builder: (_) => const InvestmentScreen(),
        );
      case Routes.walletScreen:
        return MaterialPageRoute(
          builder: (_) => const WalletScreen(),
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
