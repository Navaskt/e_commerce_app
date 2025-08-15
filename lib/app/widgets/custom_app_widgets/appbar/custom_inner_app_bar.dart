import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../constant/theme/styles.dart';

class CustomInnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapTitle;
  final VoidCallback? onTapCart;
  final VoidCallback? onTapWishlist;

  final bool showTitleButton;
  final Widget? endIcon;
  final bool selected;
  const CustomInnerAppBar({
    Key? key,
    required this.onTapTitle,
    this.onTapCart,
    this.onTapWishlist,
    this.showTitleButton = false,
    this.endIcon,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: customColors().fontPrimary),
          ),
        ),
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: InkWell(
                highlightColor: transparent,
                splashColor: transparent,
                onTap: () {
                  onTapTitle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 44,
                        child: Image.asset("assets/qliq_dashboard_logo.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      appLog(UserController().token);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/location_icon.png"),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/notification_icon.png"),
                    ),
                  ),
                  InkWell(
                    onTap: onTapWishlist,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/wishlist_icon.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onTapCart,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: selected
                          ? Image.asset("assets/cart_icon_drk.png")
                          : Image.asset("assets/cart_icon.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}
