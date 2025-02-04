import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_menu_item.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/side_bar.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:admin_dashboard/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarWidget {
  sideBarMenus(BuildContext context, selectedRoute) {
    return SideBar(
        width: MediaQuery.of(context).size.width > 900 ? 240 : 80,
        borderColor: Colors.transparent,
        backgroundColor: Colors.white,
        activeIconColor: ColorsManager.blueColor,
        textStyle: TextStyles.font16BlueRegular,
        activeTextStyle: TextStyles.font16LightBlueMedium,
        activeBackgroundColor: Colors.white,
        selectedRoute: selectedRoute,
        onSelected: (item) {
          context.pushReplacementNamed(
            "${item.route}",
          );
        },
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            route: Routes.dashboardScreen,
            selectedWidget: SvgPicture.asset(ImgPath.dashboardImgPath),
            unSelectedWidget: SvgPicture.asset(ImgPath.dashboardImgPath),
          ),
          AdminMenuItem(
              title: 'My Transactions',
              selectedWidget: SvgPicture.asset(ImgPath.transactionImgPath),
              unSelectedWidget: SvgPicture.asset(ImgPath.transactionImgPath),
              children: [
                AdminMenuItem(
                  title: 'Investments',
                  route: Routes.investmentScreen,
                  selectedWidget: SvgPicture.asset(ImgPath.chartImgPath),
                  unSelectedWidget: SvgPicture.asset(ImgPath.chartImgPath),
                ),
                AdminMenuItem(
                  title: 'My Wallet',
                  route: Routes.walletScreen,
                  selectedWidget: SvgPicture.asset(ImgPath.walletImgPath),
                  unSelectedWidget: SvgPicture.asset(ImgPath.chartImgPath),
                ),
              ]),
          AdminMenuItem(
            title: 'Wallet',
            route: Routes.walletScreen,
            selectedWidget: SvgPicture.asset(ImgPath.walletImgPath),
            unSelectedWidget: SvgPicture.asset(ImgPath.walletImgPath),
          ),
        ],
        footer: Container(
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(ImgPath.settingImgPath),
                title: Text('Settings', style: TextStyles.font16BlueRegular),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(ImgPath.logoutImgPath),
                title: Text('Logout', style: TextStyles.font16BlueRegular),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
