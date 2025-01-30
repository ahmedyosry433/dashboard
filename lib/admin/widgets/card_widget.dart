import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final int selectedCard;

  const CardWidget({
    super.key,
    required this.index,
    required this.selectedCard,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Balance',
        'imgPath': ImgPath.balanceImgPath,
        'amount': 20129,
        'date': 'April 2022',
      },
      {
        'title': 'Income',
        'imgPath': ImgPath.incomeImgPath,
        'amount': 20129,
        'date': 'April 2022',
      },
      {
        'title': 'Expenses',
        'imgPath': ImgPath.expensesImgPath,
        'amount': 20129,
        'date': 'April 2022',
      },
    ];

    final data = cardData[index];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selectedCard == index ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: selectedCard != index
            ? Border.all(color: Colors.grey.shade200)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                  data['imgPath'] as String,
                  color: selectedCard == index
                      ? ColorsManager.whiteColor
                      : ColorsManager.blueColor,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: selectedCard == index ? Colors.white : Colors.grey,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data['title'] as String,
            style: selectedCard == index
                ? TextStyles.font16WhiteSemiBold
                : TextStyles.font16BlueSemiBold,
          ),
          const SizedBox(height: 4),
          Text(
            data['date'] as String,
            style: selectedCard == index
                ? TextStyles.font14WhiteRegular
                : TextStyles.font14BlackRegular,
          ),
          const SizedBox(height: 16),
          Text(
            '\$${(data['amount'] as int).toStringAsFixed(0)}',
            style: selectedCard == index
                ? TextStyles.font24WhiteSemiBold
                : TextStyles.font24PrimrySemiBold,
          ),
        ],
      ),
    );
  }
}
