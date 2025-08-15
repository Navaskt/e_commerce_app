import 'package:flutter/material.dart';

class FloatingChatBot extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingChatBot({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/bot_icon.png', // your chatbot image
        width: 60,
        height: 60,
      ),
    );
  }
}
