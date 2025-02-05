import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin_menu_item.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.items,
    required this.index,
    this.onSelected,
    required this.selectedRoute,
    this.depth = 0,
    this.iconColor,
    this.activeIconColor,
    required this.textStyle,
    required this.activeTextStyle,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.borderColor,
  });

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;

  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: _buildTiles(context, items[index]),
    );
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(selectedRoute, [item]);

    if (item.children.isEmpty) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFECF0F8) : Colors.white,
        ),
        child: ListTile(
          contentPadding: _getTilePadding(depth),
          leading: _buildIcon(item.selectedWidget, item.unSelectedWidget, selected),
          title: _buildTitle(item.title, selected),
          selected: selected,
          trailing: MediaQuery.of(context).size.width > 900
              ? selected
                  ? const Padding(
                      padding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                      child: VerticalDivider(
                        color: Color(0xFF4EB7F2),
                        thickness: 4,
                      ),
                    )
                  : null
              : const SizedBox(),
          selectedTileColor: activeBackgroundColor,
          onTap: () {
            if (onSelected != null) {
              onSelected!(item);
            }
          },
        ),
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        selectedRoute: selectedRoute,
        depth: depth,
        iconColor: iconColor,
        activeIconColor: activeIconColor,
        textStyle: textStyle,
        activeTextStyle: activeTextStyle,
        backgroundColor: backgroundColor,
        activeBackgroundColor: activeBackgroundColor,
        borderColor: borderColor,
      );
    }).toList();

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: ExpansionTile(
          trailing: const SizedBox(),
          tilePadding: _getTilePadding(depth),
          leading: _buildIcon(item.selectedWidget, item.unSelectedWidget, selected),
          title: _buildTitle(item.title),
          initiallyExpanded: selected,
          children: childrenTiles,
        ),
      ),
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children.isNotEmpty) {
        return _isSelected(route, item.children);
      }
    }
    return false;
  }

  Widget _buildIcon(Widget selectedWidget, Widget unSelectedWidget, [bool selected = false]) {
    return selected ? selectedWidget : unSelectedWidget;
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(
      1.sw > 900 ? title : "",
      style: selected ? activeTextStyle : textStyle,
    );
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10 + 10.0 * depth,
      right: 10.0,
    );
  }
}
