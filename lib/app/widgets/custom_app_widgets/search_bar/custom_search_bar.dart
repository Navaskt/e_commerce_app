import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: TextField(
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: customTextStyle(
            fontStyle: FontStyle.BodyL_SemiBold,
            color: FontColor.FontPrimary,
          ),
          suffixIcon: Image.asset("assets/search_icon.png"),
          filled: true,
          fillColor: customColors().backgroundSecondary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
