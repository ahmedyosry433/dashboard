// ignore_for_file: deprecated_member_use

import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveDrawer extends StatefulWidget {
  const ResponsiveDrawer({super.key});

  @override
  State<ResponsiveDrawer> createState() => _ResponsiveDrawerState();
}

class _ResponsiveDrawerState extends State<ResponsiveDrawer> {
  int selectedLink = 0;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 400;
    final isTabletLayout = MediaQuery.of(context).size.width < 901;

    if (isMobile) {
      return _buildMobileDrawer(context);
    } else if (isTabletLayout) {
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
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: [
                _buildDrawerIcon(index: 0, item: listItems[0], isTablet: true),
                ExpansionTile(
                  title: const Text(''),
                  leading: SvgPicture.asset(listItems[1].iconPath),
                  tilePadding: const EdgeInsets.only(left: 10),
                  children: [
                    _buildDrawerIcon(
                        index: 1, item: listItems[2], isTablet: true),
                    _buildDrawerIcon(
                        index: 2, item: listItems[3], isTablet: true),
                  ],
                ),
                _buildDrawerIcon(index: 3, item: listItems[4], isTablet: true),
              ],
            ),
          ),
          _buildBottomIcons(isTablet: true),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 100),
              children: [
                _buildDrawerIcon(index: 0, item: listItems[0], isTablet: false),
                ExpansionTile(
                  title: Text(
                    listItems[1].title,
                    style: TextStyles.font16BlueRegular,
                  ),
                  leading: SvgPicture.asset(listItems[1].iconPath),
                  tilePadding: const EdgeInsets.only(left: 10),
                  children: [
                    _buildDrawerIcon(
                        index: 1, item: listItems[2], isTablet: false),
                    _buildDrawerIcon(
                        index: 2, item: listItems[3], isTablet: false),
                  ],
                ),
                _buildDrawerIcon(index: 3, item: listItems[4], isTablet: false),
              ],
            ),
          ),
          _buildBottomIcons(isTablet: false),
        ],
      ),
    );
  }

  Widget _buildBottomIcons({required bool isTablet}) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(ImgPath.settingImgPath),
          title: isTablet
              ? const Text("")
              : Text('Settings', style: TextStyles.font16BlueRegular),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(ImgPath.logoutImgPath),
          title: isTablet
              ? const Text("")
              : Text('Logout', style: TextStyles.font16BlueRegular),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildDrawerIcon(
      {required int index, required ListItem item, required bool isTablet}) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          border: Border(
              right: BorderSide(
            width: 3,
            color:
                selectedLink == index ? ColorsManager.blueColor : Colors.white,
          ))),
      child: ListTile(
        leading: SvgPicture.asset(
          item.iconPath,
          color: ColorsManager.blueColor,
        ),
        title: isTablet
            ? const Text("")
            : Text(
                item.title,
                style: selectedLink == index
                    ? TextStyles.font16LightBlueMedium
                    : TextStyles.font16BlueRegular,
              ),
        onTap: () {
          setState(() {
            selectedLink = index;
          });
        },
      ),
    );
  }

  final List<ListItem> listItems = [
    ListItem(iconPath: ImgPath.dashboardImgPath, title: 'Dashboard'),
    ListItem(iconPath: ImgPath.transactionImgPath, title: 'My Transactions'),
    ListItem(iconPath: ImgPath.statisticsImgPath, title: 'Statistics'),
    ListItem(iconPath: ImgPath.walletImgPath, title: 'Wallet'),
    ListItem(iconPath: ImgPath.chartImgPath, title: 'Investments'),
  ];
}

class ListItem {
  final String iconPath;
  final String title;

  ListItem({required this.iconPath, required this.title});
}
