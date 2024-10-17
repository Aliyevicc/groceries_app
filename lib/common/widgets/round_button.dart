import 'package:flutter/material.dart';

import '../style/color_extensions/color_extensions.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      height: media.height * 0.075,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      elevation: 0.1,
      color: TColor.primary,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: media.width * 0.07,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final VoidCallback onPressed;
  const RoundIconButton({super.key, required this.title, required this.onPressed, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      height: media.height * 0.073,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      elevation: 0.1,
      color: color,
      child: Row(
        children: [
          Image.asset(icon, width: 22,height: 22,fit: BoxFit.contain,),
          const SizedBox(width: 35,),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: media.width * 0.06,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

