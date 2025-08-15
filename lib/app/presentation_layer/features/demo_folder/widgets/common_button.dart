import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CommonButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(double.infinity, 48),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
