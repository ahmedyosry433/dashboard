// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/features/dashboard/presentation/widgets/mobile_layout.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({required this.child, super.key});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = MediaQuery.of(context).size.width < 400;
      final isWebLayout = MediaQuery.of(context).size.width < 900;
      final isTabletLayout = MediaQuery.of(context).size.width > 901;

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
