import 'package:admin_dashboard/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveDrawer extends StatelessWidget {
  const ResponsiveDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    if (isMobile) {
      return _buildMobileDrawer(context);
    } else if (isTablet) {
      return _buildTabletDrawer(context);
    } else {
      return _buildWebDrawer(context);
    }
  }

  Widget _buildWebDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Admin Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              //! Navigate to Dashboard
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Expenses'),
            onTap: () {
              //! Navigate to Expenses
            },
          ),
          //! Add more items as needed
        ],
      ),
    );
  }

  Widget _buildTabletDrawer(BuildContext context) {
    return Drawer(
      width: 70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            onTap: () {
              // Navigate to Dashboard
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            onTap: () {
              // Navigate to Expenses
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                
                ListTile(
                  leading: SvgPicture.asset(ImgPath.dashboardImgPath),
                  title: const Text('Dashboard'),
                  onTap: () {
                    // Navigate to Dashboard
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.transactionImgPath),
                  title: const Text('My Transaction'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.statisticsImgPath),
                  title: const Text('Statistics'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.walletImgPath),
                  title: const Text('Wallet Account'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.chartImgPath),
                  title: const Text('My Investments'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: SvgPicture.asset(ImgPath.settingImgPath),
                  title: const Text('Setting system'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.logoutImgPath),
                  title: const Text('Logout account'),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
