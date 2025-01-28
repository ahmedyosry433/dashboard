import 'package:admin_dashboard/admin/screen/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: DashboardScreen(),
        breakpoints: [
          Breakpoint(start: 0, end: 480, name: MOBILE),
          Breakpoint(start: 481, end: 1200, name: TABLET),
          Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
        ],
      ),
      home: DashboardScreen(),
    );
  }
}
