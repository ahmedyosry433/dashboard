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
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DashboardScreen(),
        );
      case Routes.investmentScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              InvestmentScreen(),
        );
      case Routes.walletScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const WalletScreen(),
        );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => HomeScreen(),
      //   );

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

// import 'package:admin_dashboard/home/screen/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:admin_dashboard/core/Router/routes.dart';
// import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
// import 'package:admin_dashboard/features/invoices/presentation/view/invesment_screen.dart';
// import 'package:admin_dashboard/features/wallet/presentation/view/wallet_screen.dart';

// final GoRouter appRouter = GoRouter(
//   initialLocation: Routes.homeScreen,
//   routes: [
//     ShellRoute(
//       builder: (context, state, child) => HomeScreen(child: child),
//       routes: [
//         GoRoute(
//           path: Routes.homeScreen,
//           pageBuilder: (context, state) =>
//               const MaterialPage(child: DashboardScreen()),
//         ),
//         GoRoute(
//           path: Routes.dashboardScreen,
//           pageBuilder: (context, state) =>
//               const MaterialPage(child: DashboardScreen()),
//         ),
//         GoRoute(
//           path: Routes.investmentScreen,
//           pageBuilder: (context, state) =>
//               MaterialPage(child: InvestmentScreen()),
//         ),
//         GoRoute(
//           path: Routes.walletScreen,
//           pageBuilder: (context, state) =>
//               const MaterialPage(child: WalletScreen()),
//         ),
//       ],
//     ),
//   ],
//   errorBuilder: (context, state) => Scaffold(
//     body: Center(
//       child: Text('No Route Defined For ${state.uri}'),
//     ),
//   ),
// );
