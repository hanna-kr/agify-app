import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';

ButtonStyle kPrimaryButtonStyle = const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(MyColor.primary));

ButtonStyle kSecondaryButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(MyColor.white),
  side: MaterialStateProperty.all(const BorderSide(color: MyColor.primary)),
  foregroundColor: MaterialStateProperty.all(MyColor.primary),
);
