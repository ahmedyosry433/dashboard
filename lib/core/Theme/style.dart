import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  //Blue Color
  static TextStyle font16BlueSemiBold = const TextStyle(
    color: ColorsManager.blueColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20BlueSemiBold = const TextStyle(
    color: ColorsManager.blueColor,
    fontSize: 20,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16BlueMedium = const TextStyle(
    color: ColorsManager.blueColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
  );
  //Primary Color
  static TextStyle font24PrimrySemiBold = const TextStyle(
    color: ColorsManager.primryColor,
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
  );
  //White Color
  static TextStyle font16WhiteSemiBold = const TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font24WhiteSemiBold = const TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14WhiteRegular = const TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );
  // Black Color

  static TextStyle font16BlackSemiBold = const TextStyle(
    color: ColorsManager.blackColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font24BlackSemiBold = const TextStyle(
    color: ColorsManager.blackColor,
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14BlackRegular = const TextStyle(
    color: ColorsManager.blackColor,
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );

  // Grey Color
  static TextStyle font14GreyRegular = const TextStyle(
    color: ColorsManager.lightGreyColor,
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16GreyRegular = const TextStyle(
    color: ColorsManager.lightGreyColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16GreySemiBold = const TextStyle(
    color: ColorsManager.lightGreyColor,
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
  );
}
