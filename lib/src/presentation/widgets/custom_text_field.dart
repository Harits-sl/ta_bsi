import 'package:flutter/material.dart';
import 'package:ta_bsi/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.isObscure = false,
  }) : super(key: key);

  final String title;
  final bool isObscure;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final String _title;
  late final bool _isObcure;
  late final TextEditingController _controller;

  @override
  void initState() {
    _title = widget.title;
    _isObcure = widget.isObscure;
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: TextFormField(
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
            cursorColor: blackColor,
            controller: _controller,
            obscureText: _isObcure,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              fillColor: grayColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: BorderRadius.circular(50),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: grayColor),
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: grayColor),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
