import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: const DashboardScreen(),
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
        ],
      ),
      home: const DashboardScreen(),
    );
  }
}
