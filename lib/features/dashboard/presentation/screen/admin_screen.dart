import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:admin_dashboard/features/dashboard/data/models/layoutinfo_model.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/mobile_layout.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/web_tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final layoutInfo = _getLayoutInfo(context);
    SideBarWidget sideBar = SideBarWidget();

    return AdminScaffold(
      sideBar: sideBar.sideBarMenus(context, Routes.dashboardScreen),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (layoutInfo.isWebLayout || layoutInfo.isTabletLayout)
            WebTabletLayout(
              isMobile: layoutInfo.isMobile,
              isTabletLayout: layoutInfo.isTabletLayout,
              isWebLayout: layoutInfo.isWebLayout,
            )
          else
            MobileLayout(
              isMobile: layoutInfo.isMobile,
              isTabletLayout: layoutInfo.isTabletLayout,
              isWebLayout: layoutInfo.isWebLayout,
            ),
        ],
      ),
    );
  }

  LayoutInfo _getLayoutInfo(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isWebLayout = ResponsiveBreakpoints.of(context).isDesktop;
    final isTabletLayout = ResponsiveBreakpoints.of(context).isTablet;

    return LayoutInfo(
      isMobile: isMobile,
      isWebLayout: isWebLayout,
      isTabletLayout: isTabletLayout,
    );
  }
}
