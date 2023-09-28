import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  static const headline1 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.primaryDark);

  static const headline2 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: MyColor.primaryDark);

  static const light = TextStyle(color: MyColor.white, fontSize: 20);

  static const buttonLight = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.white);

  static const body = TextStyle(fontSize: 16, color: MyColor.primaryDark);
}
