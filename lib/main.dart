import 'package:admin_dashboard/core/Router/app_router.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, super.key});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? Container(),
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 930, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashboardScreen,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
