import 'package:flutter/material.dart';

import '../../../../../../constant/theme/styles.dart';
import '../../../../../widgets/custom_app_widgets/appbar/custom_inner_app_bar.dart';
import '../../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../../widgets/custom_app_widgets/button/primary_button.dart';
import '../../../../../widgets/custom_app_widgets/scrollabel_bottomsheet/scrollable_bottomsheet.dart';
import '../../../demo_folder/screens/demo_screen.dart';
import '../../../feature_account/components/menu_list_item_card.dart';
import '../../components/order_placed_bottomsheet.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

bool _isDeliverySelected = true;

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInnerAppBar(
        selected: true,
        onTapTitle: () {
          Navigator.of(context).pop();
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    'CHECKOUT',
                    style: customTextStyle(
                      fontStyle: FontStyle.BodyXL_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                      textAlign: TextAlign.center,
                      style: customTextStyle(
                        fontStyle: FontStyle.HeaderXS_SemiBold,
                        color: FontColor.FontPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    verticalPadding: 0,
                    text: 'Delivery',
                    height: 48,
                    onPressed: () {
                      setState(() {
                        _isDeliverySelected = true;
                      });
                    },
                    isFilled: _isDeliverySelected,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    verticalPadding: 0,
                    height: 48,
                    text: 'Pickup',
                    onPressed: () {
                      setState(() {
                        _isDeliverySelected = false;
                      });
                    },
                    isFilled: !_isDeliverySelected,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Where?',
                style: customTextStyle(fontStyle: FontStyle.BodyXL_SemiBold),
              ),
            ),
            MenuListItem(
              title: "Dubai",
              startIcon: "assets/location_fill_icon.png",
              showStartIcon: true,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MenuListItem(
                title: "Send as a Gift",
                startIcon: "assets/gift_icon.png",
                showStartIcon: true,
                onTap: () {},
              ),
            ),
            Card(
              color: customColors().backgroundPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: customColors().grey),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: customTextStyle(
                      fontStyle: FontStyle.HeaderXS_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                    hintText: 'Add note for the courier',
                    border: InputBorder.none,
                    prefixIcon: Image.asset("assets/message_icon.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'When?',
                style: customTextStyle(fontStyle: FontStyle.BodyXL_SemiBold),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: customColors().pacificBlue),
              ),
              color: customColors().backgroundPrimary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Standard',
                      style: customTextStyle(
                        fontStyle: FontStyle.HeaderXS_SemiBold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '30 - 40 Min',
                          style: customTextStyle(
                            fontStyle: FontStyle.HeaderXS_SemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Payment Method',
              style: customTextStyle(fontStyle: FontStyle.BodyXL_SemiBold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRoundedButton(
                text: "Place Order",
                bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                bordercolor: customColors().backgroundPrimary,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
                onpress: () {
                  customShowModalBottomSheet(
                    context: context,
                    inputWidget: OrderPlacedBottomsheet(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
