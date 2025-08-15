import 'package:flutter/material.dart';

import '../../../../constant/theme/styles.dart';

customShowModalBottomSheet({
  required BuildContext context,
  required Widget inputWidget,
  AnimationController? controller,
  BoxConstraints? heightConstraint,
  bool dismissable = true,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    transitionAnimationController: controller,
    isDismissible: dismissable,
    enableDrag: dismissable,
    constraints:
        heightConstraint ??
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
    ),
    builder: (BuildContext buildcontext) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: SingleChildScrollView(
                child: AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Container(
                          decoration: BoxDecoration(
                            color: customColors().backgroundPrimary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 4,
                          width: 64,
                        ),
                      ),
                      inputWidget,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
