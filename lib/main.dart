import 'package:admin_dashboard/core/Router/app_router.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashboardScreen,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}



// import 'package:admin_dashboard/core/Router/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       builder: (context, child) => ResponsiveBreakpoints.builder(
//         child: child ?? Container(),
//         breakpoints: [
//           const Breakpoint(start: 0, end: 480, name: MOBILE),
//           const Breakpoint(start: 930, end: 1200, name: TABLET),
//           const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
//         ],
//       ),
//       debugShowCheckedModeBanner: false,
//       routerConfig: appRouter,
//     );
//   }
// }
