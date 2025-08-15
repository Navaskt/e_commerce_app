
import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

import '../../../../constant/text.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final BuildContext context;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.context,
    required this.onTap,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: customColors().backgroundSecondary),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            index: 0,
            activeIconPath: "assets/discover_icon.png",
            inactiveIconPath: "assets/discover_icon.png",
            label: Texts.bottomBarItem1,
          ),
          _buildNavItem(
            index: 1,
            activeIconPath: "assets/resturant_icon.png",
            inactiveIconPath: "assets/resturant_icon.png",
            label: Texts.bottomBarItem2,
          ),
          _buildNavItem(
            index: 2,
            activeIconPath: "assets/store_icon.png",
            inactiveIconPath: "assets/store_icon.png",
            label: Texts.bottomBarItem3,
          ),
          _buildNavItem(
            index: 3,
            activeIconPath: "assets/qliqtv_icon.png",
            inactiveIconPath: "assets/qliqtv_icon.png",
            label: Texts.bottomBarItem4,
          ),
          _buildNavItem(
            index: 4,
            activeIconPath: "assets/face_icon.png",
            inactiveIconPath: "assets/face_icon.png",
            label: Texts.bottomBarItem5,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String activeIconPath,
    required String inactiveIconPath,
    required String label,
  }) {
    bool isSelected = widget.selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(activeIconPath),
              color: isSelected
                  ? customColors().pacificBlue
                  : customColors().fontPrimary,
              size: 24,
            ),
            Text(
              label,
              style: customTextStyle(
                fontStyle: FontStyle.BodyM_SemiBold,
                color: isSelected
                    ? FontColor.PacificBlue
                    : FontColor.FontPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
