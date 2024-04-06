import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
  });

  final VoidCallback onTap;
  final Color? iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
