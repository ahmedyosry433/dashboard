import 'package:admin_dashboard/admin/widgets/responisive_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: isMobile ? 50 : 0,
        leading: isMobile
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              )
            : null,
      ),
      drawer: isMobile ? const ResponsiveDrawer() : null,
      body: Row(
        children: [
          if (!isMobile) const ResponsiveDrawer(),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Your content here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
