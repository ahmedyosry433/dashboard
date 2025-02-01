import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveDrawer extends StatefulWidget {
  const ResponsiveDrawer({super.key});

  @override
  State<ResponsiveDrawer> createState() => _ResponsiveDrawerState();
}

class _ResponsiveDrawerState extends State<ResponsiveDrawer> {
  int selectedLink = 0;

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

  Widget _buildTabletDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 70,
      child: Column(
        children: [
          Expanded(
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    final item = listItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: selectedLink == index
                            ? ColorsManager.blueColor
                            : Colors.white,
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          item.iconPath,
                          color: selectedLink == index
                              ? ColorsManager.whiteColor
                              : ColorsManager.blueColor,
                        ),
                        onTap: () {
                          setState(() {
                            selectedLink = index;
                          });
                        },
                      ),
                    );
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

  final List<ListItem> listItems = [
    ListItem(
      iconPath: ImgPath.dashboardImgPath,
      title: 'Dashboard',
    ),
    ListItem(
      iconPath: ImgPath.transactionImgPath,
      title: 'My Transaction',
    ),
    ListItem(
      iconPath: ImgPath.statisticsImgPath,
      title: 'Statistics',
    ),
    ListItem(
      iconPath: ImgPath.walletImgPath,
      title: 'Wallet Account',
    ),
    ListItem(
      iconPath: ImgPath.chartImgPath,
      title: 'My Investments',
    ),
  ];

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
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
                  color: ColorsManager.lightGreyColor,
                  child: SvgPicture.asset(ImgPath.galleryImgPath),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.all(10),
                  color: ColorsManager.lighterGreyColor,
                  child: Row(
                    children: [
                      SvgPicture.asset(ImgPath.userImgPath),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lekan Okeowo',
                              style: TextStyles.font16BlueSemiBold),
                          Text('demo@gmail.com',
                              style: TextStyles.font12GreyRegular),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    final item = listItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: selectedLink == index
                                ? ColorsManager.lighterBlueColor
                                : Colors.white,
                            width: 4,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(item.iconPath),
                        title: Text(
                          item.title,
                          style: selectedLink == index
                              ? TextStyles.font16LightBlueBold
                              : TextStyles.font16BlueRegular,
                        ),
                        onTap: () {
                          setState(() {
                            selectedLink = index;
                          });
                        },
                      ),
                    );
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
                  title: Text('Setting system',
                      style: TextStyles.font16BlueRegular),
                  onTap: () {
                    // Navigate to Expenses
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(ImgPath.logoutImgPath),
                  title: Text('Logout account',
                      style: TextStyles.font16BlueRegular),
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

class ListItem {
  final String iconPath;
  final String title;

  ListItem({
    required this.iconPath,
    this.title = '',
  });
}
