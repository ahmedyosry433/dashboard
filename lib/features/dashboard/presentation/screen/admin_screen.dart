import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/mobile_layout.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/web_tablet_layout.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    final isWebLayout = MediaQuery.of(context).size.width < 1100;
    final isTabletLayout = MediaQuery.of(context).size.width > 1101;
    SideBarWidget sideBar = SideBarWidget();

    return LayoutBuilder(builder: (context, constraints) {
      return AdminScaffold(
          backgroundColor: isTabletLayout ? Colors.grey[100] : Colors.white,
          sideBar: sideBar.sideBarMenus(context, Routes.dashboardScreen),
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 40,
          ),
          mobileThreshold: 400,
          body: isMobile
              ? MobileLayout(
                  isMobile: isMobile,
                  isTabletLayout: isTabletLayout,
                  isWebLayout: isWebLayout,
                )
              : WebTabletLayout(
                  isMobile: isMobile,
                  isTabletLayout: isTabletLayout,
                  isWebLayout: isWebLayout,
                ));
    });
  }
}
