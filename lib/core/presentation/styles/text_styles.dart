import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  static const headline1 = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: MyColor.black);

  static const headline2 = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: MyColor.black);

  static const light =
      TextStyle(fontFamily: 'Poppins', color: MyColor.white, fontSize: 20);

  static const buttonLight = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: MyColor.white);

  static const body =
      TextStyle(fontFamily: 'Poppins', fontSize: 16, color: MyColor.black);

  static const hintText =
      TextStyle(fontFamily: 'Poppins', fontSize: 14, color: MyColor.blue);
}
