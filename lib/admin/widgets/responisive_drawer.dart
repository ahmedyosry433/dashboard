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
      return _buildMobileDrawer(context);
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
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: SvgPicture.asset(ImgPath.galleryImgPath),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.dashboardImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.transactionImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.statisticsImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.walletImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.chartImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ListTile(
                  leading: SvgPicture.asset(ImgPath.settingImgPath),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.logoutImgPath),
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

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: ListView(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blueGrey,
                  child: SvgPicture.asset(ImgPath.galleryImgPath),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    color: Colors.lightGreenAccent,
                    child: Row(
                      children: [
                        SvgPicture.asset(ImgPath.userImgPath),
                        const SizedBox(width: 10),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lekan Okeowo',
                                  style: TextStyle(fontSize: 20)),
                              Text('demo@gmail.com'),
                            ]),
                      ],
                    )),
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
