import 'package:admin_dashboard/core/Router/app_router.dart';
import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/features/home/bussines/cubit/home_cubit.dart';
import 'package:admin_dashboard/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeCubit()),
    ],
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, super.key});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: HomeScreen(),
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
