import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/button/custom_rounded_button.dart';

import '../../../../../constant/theme/styles.dart';

class CommonSelectorWidget extends StatefulWidget {
  final double? buttonHight;
  final double? verticalPadding;
  final int selectedIndex;
  final List<String> buttonTitle;
  final void Function(String)? onPressed;
  const CommonSelectorWidget({
    super.key,
    required this.buttonTitle,
    this.verticalPadding,
    this.selectedIndex = 0,
    this.buttonHight,
    this.onPressed,
  });

  @override
  State<CommonSelectorWidget> createState() => _CommonSelectorWidgetState();
}

class _CommonSelectorWidgetState extends State<CommonSelectorWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.buttonTitle.length,
        (index) => _buildGenderButton(index),
      ),
      //  [
      //   _buildGenderButton('Male'),
      //   const SizedBox(width: 16),
      //   _buildGenderButton('Female'),
      // ],
    );
  }

  Widget _buildGenderButton(int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: CustomRoundedButton(
        verticalPadding: widget.verticalPadding ?? 6,
        text: widget.buttonTitle[index],
        textStyle: customTextStyle(
          fontStyle: FontStyle.HeaderXS_SemiBold,
          color: isSelected ? FontColor.FontSecondary : FontColor.FontPrimary,
        ),
        bgcolor: isSelected
            ? customColors().pacificBlue
            : customColors().backgroundPrimary,
        bordercolor: customColors().pacificBlue,
        height: widget.buttonHight ?? 40,
        onpress: () {
          setState(() {
            _selectedIndex = index;
            widget.onPressed!(widget.buttonTitle[_selectedIndex]);
          });
        },
      ),
    );
  }
}
