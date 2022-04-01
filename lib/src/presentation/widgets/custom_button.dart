import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.textStyle,
    required this.backgroundColor,
    required this.borderRadius,
    required this.onPressed,
    this.iconUrl,
  }) : super(key: key);

  final String title;
  final TextStyle textStyle;
  final Color backgroundColor;
  final double borderRadius;
  final String? iconUrl;
  final dynamic onPressed;

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
