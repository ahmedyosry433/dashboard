// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/features/dashboard/presentation/widgets/mobile_layout.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({required this.child, super.key});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = ResponsiveBreakpoints.of(context).isMobile;
      final isWebLayout = ResponsiveBreakpoints.of(context).isDesktop;
      final isTabletLayout = ResponsiveBreakpoints.of(context).isTablet;

      if (constraints.maxWidth < 600) {
        return MobileLayout(
          isMobile: isMobile,
          isTabletLayout: isTabletLayout,
          isWebLayout: isWebLayout,
        );
      } else {
        return Row(
          children: [
            if (isTabletLayout || isWebLayout) const ResponsiveDrawer(),
            Expanded(child: child),
          ],
        );
      }
    });
  }
}
