import 'package:flutter/material.dart';
import 'package:personal_notes_app/constants/app_colors.dart';
import 'package:personal_notes_app/constants/app_fonts.dart';

AppBar customAppBar({
  bool? centerTitle,
  required String title,
  bool showLeadingButton = false,
  Widget? actionButton,
}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    automaticallyImplyLeading: false,
    centerTitle: centerTitle,
    title: Text(
      title,
      style: AppFonts.heading,
    ),
    leading: (showLeadingButton)
        ? const BackButton(color: AppColors.secondaryColor)
        : null,
    actions: [
      if (actionButton != null) actionButton,
    ],
  );
}
