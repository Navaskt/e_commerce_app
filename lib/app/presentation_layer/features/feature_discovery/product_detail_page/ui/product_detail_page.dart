import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/repository/models/response/product_list_response.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../../../constant/theme/styles.dart';
import '../../../../../widgets/custom_app_widgets/appbar/custom_inner_app_bar.dart';
import '../../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../feature_cart/components/product_description_widget.dart';
import '../../../feature_cart/components/quantiry_selecter_widget.dart';

class ProductDetaiPage extends StatefulWidget {
  final ProductList item;
  final ServiceLocator serviceLocator;

  const ProductDetaiPage(this.serviceLocator, {super.key, required this.item});

  @override
  State<ProductDetaiPage> createState() => _ProductDetaiPageState();
}

class _ProductDetaiPageState extends State<ProductDetaiPage> {
  int quantity = 1;
  bool addedtoCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: customColors().backgroundPrimary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInnerAppBar(
                onTapCart: () {
                  widget.serviceLocator.navigationService.openCartPage(context);
                },
                onTapTitle: () {
                  Navigator.of(context).pop();
                },
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: 360,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.network(
                        widget.item.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ProductDescriptionWidget(item: widget.item),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            children: [
              QuantitySelector(initialQuantity: 1, onChanged: (p0) {}),
              // QuantitySelector(
              //   onDecrement: () {
              //     if (quantity > 1) {
              //       setState(() {
              //         addedtoCart = false;
              //         quantity--;
              //       });
              //     }
              //   },
              //   onIncrement: () {
              //     setState(() {
              //       addedtoCart = false;
              //       quantity++;
              //     });
              //   },
              //   quantity: quantity,
              // ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: CustomRoundedButton(
                  bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                  onpress: () async {
                    appLog(widget.item.id);
                    appLog(UserController().token);
                    bool result = await sendAddProductToCartReq(
                      widget.item.id,
                      quantity,
                    );
                    if (result) {
                      setState(() {
                        addedtoCart = true;
                      });
                    }
                  },
                  bordercolor: customColors().backgroundPrimary,
                  text: addedtoCart ? "Added To Cart" : "Add To Cart",
                  textStyle: customTextStyle(
                    color: FontColor.PacificBlue,
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> sendAddProductToCartReq(String productID, int qty) async {
    try {
      final result = await widget.serviceLocator.apiService
          .sendAddtoCartRequest(productID: productID, qty: qty);
      if (result.cartItem.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
