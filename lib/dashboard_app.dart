import 'package:admin_dashboard/core/Router/app_router.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final AppRouter appRouter;
  const Dashboard({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
     
    );
  }
}
