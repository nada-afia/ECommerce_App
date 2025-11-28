import 'package:ecommerce/core/utilits/app_styles.dart';
import 'package:flutter/material.dart';
class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool? haveIcon;
  final Widget? iconWidget;
  double height;
   CustomElevatedButton({
    super.key,
     this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.textStyle,
   this.haveIcon,
    this.iconWidget,
     this.height = 50
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:(haveIcon ?? false)?
        iconWidget!:
        Text(
          text??'',
          style: textStyle??AppStyles.blueSemiBold20,
        ),
      ),
    );
  }
}