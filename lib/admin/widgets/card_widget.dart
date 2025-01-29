// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  int selectedCard = 0;
  int index;
  CardWidget({required this.index, required this.selectedCard, super.key});
  final titles = ['Balance', 'Income', 'Expenses'];
  final icons = <String>[
    ImgPath.balanceImgPath,
    ImgPath.incomeImgPath,
    ImgPath.expensesImgPath,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selectedCard == index
              ? ColorsManager.primryColor
              : ColorsManager.lighgreyColor,
        ),
        color: selectedCard == index
            ? ColorsManager.primryColor
            : ColorsManager.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedCard == index
                        ? ColorsManager.whiteColor.withOpacity(.2)
                        : ColorsManager.lighterGreyColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    icons[index],
                    color: selectedCard == index
                        ? ColorsManager.whiteColor
                        : ColorsManager.primryColor,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedCard == index
                        ? ColorsManager.whiteColor.withOpacity(.2)
                        : ColorsManager.lighterGreyColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    ImgPath.arrowImgPath,
                    color: selectedCard == index
                        ? ColorsManager.whiteColor
                        : ColorsManager.blueColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              titles[index],
              style: selectedCard == index
                  ? TextStyles.font16WhiteSemiBold
                  : TextStyles.font16BlueSemiBold,
            ),
            const SizedBox(height: 8),
            Text(
              'April 2022',
              style: selectedCard == index
                  ? TextStyles.font14WhiteRegular
                  : TextStyles.font14BlackRegular,
            ),
            const SizedBox(height: 8),
            Text(
              '\$20,129',
              style: selectedCard == index
                  ? TextStyles.font24WhiteSemiBold
                  : TextStyles.font24PrimrySemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
