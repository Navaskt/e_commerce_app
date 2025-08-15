import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/repository/models/response/all_cart_product_response.dart';

import '../../../../widgets/custom_app_widgets/appbar/custom_inner_app_bar.dart';
import '../../feature_cart/components/cart_item_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomInnerAppBar(
        selected: true,
        onTapTitle: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CartItemCard(
                    onWishlist: true,
                    item: CartItem(
                      productItem: ProductListItem(
                        image: "assets/demo_icon5.png",
                        name: "Demo Product",
                        price: 500,
                      ),
                      quantity: 5,
                      id: "",
                    ),
                    onQuantityChanged: (qty) {},
                    onRemove: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
