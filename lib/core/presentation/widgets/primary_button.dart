import 'package:agify_app/core/presentation/styles/border_styles.dart';
import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:agify_app/core/presentation/styles/position_styles.dart';
import 'package:agify_app/core/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: MyColor.primary,
            borderRadius: MyBorderRadius.m,
            child: InkWell(
              borderRadius: MyBorderRadius.m,
              onTap: widget.onPressed,
              child: Center(
                  child: Padding(
                padding: PaddingAll.m,
                child: Text(
                  widget.text,
                  style: MyTextStyle.buttonLight,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
