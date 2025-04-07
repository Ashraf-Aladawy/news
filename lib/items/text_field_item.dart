import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  TextFieldItem(
      {super.key,
      required this.lable,
      this.prefixIcon = null,
      this.suffixIcon = null,
      this.controller,
      required this.validate,
      this.isObscure = false,
      required this.onSearch});

  String lable;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  Function validate;
  Function onSearch;
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value),
      onChanged: (value) => onSearch(value),
      controller: controller,
      obscureText: isObscure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: lable,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.normal),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff171717)),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff171717)),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff171717)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
