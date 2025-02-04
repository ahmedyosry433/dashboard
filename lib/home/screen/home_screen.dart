// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';
import 'package:admin_dashboard/home/screen/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.child, super.key});
  Widget child;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final PageStorageBucket _bucket = PageStorageBucket();

    return LayoutBuilder(builder: (context, constraints) {
      return PageStorage(
        bucket: _bucket,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          key: _scaffoldKey,
          appBar: constraints.maxWidth < 900
              ? AppBar(
                  leading: IconButton(
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                      icon: const Icon(Icons.menu)),
                )
              : null,
          drawer: const ResponsiveDrawer(),
          body: HomeViewBody(
            child: child,
          ),
        ),
      );
    });
  }
}
