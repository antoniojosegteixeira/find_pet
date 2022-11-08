import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.disabled})
      : super(key: key);

  final String text;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? AppColors.colorDarkBlue_800)),
      onPressed: disabled == true
          ? null
          : () {
              onPressed();
            },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'headlinefont', fontSize: 14, color: textColor),
          ),
        ),
      ),
    );
  }
}
