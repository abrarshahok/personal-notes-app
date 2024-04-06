import 'package:flutter/material.dart';
import 'package:personal_notes_app/constants/app_colors.dart';
import 'package:personal_notes_app/constants/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.onSaved,
    required this.validator,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      style: AppFonts.bodyText1,
      decoration: InputDecoration(
        label: Text(
          label,
          style: AppFonts.bodyText2,
        ),
        errorStyle: AppFonts.bodyText2,
        suffixIcon: suffixIcon,
        enabledBorder: _getBorder(AppColors.primaryColor.withOpacity(0.3)),
        focusedBorder: _getBorder(AppColors.primaryColor),
        focusedErrorBorder: _getBorder(Colors.red),
        errorBorder: _getBorder(Colors.red),
      ),
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
    );
  }

  OutlineInputBorder _getBorder(Color color) => OutlineInputBorder(
        gapPadding: 5,
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
}
