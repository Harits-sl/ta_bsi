import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius = 0.0,
    this.iconUrl,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  double borderRadius;
  final String? iconUrl;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconUrl == null
                ? const SizedBox()
                : Image.asset(iconUrl!, width: 24, height: 24),
            iconUrl == null ? const SizedBox() : const SizedBox(width: 10),
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
