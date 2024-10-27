import 'package:flutter/material.dart';
import 'package:groceries/common/style/color_extensions/color_extensions.dart';

class CustomKeyboardButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  const CustomKeyboardButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return text != null && icon == null
        ? MaterialButton(
      onPressed: onPressed,
      height: 53,
      minWidth: 93.67,
      color: TColor.backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: TColor.darkGrey,
        ),
      ),
    )
        : MaterialButton(
      onPressed: onPressed,
      height: 53,
      minWidth: 93.67,
      color: TColor.backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}