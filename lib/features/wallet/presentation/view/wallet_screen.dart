import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarWidget sideBar = SideBarWidget();

    return AdminScaffold(
      backgroundColor: Colors.white,
      sideBar: sideBar.sideBarMenus(context, Routes.walletScreen),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Wallet Screen'),
      ),
    );
  }
}
