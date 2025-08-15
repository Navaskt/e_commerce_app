import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/components/quantiry_selecter_widget.dart';
import 'package:qliqmobile_jobtest/app/repository/models/response/all_cart_product_response.dart';

import '../../../../../constant/theme/styles.dart';

class CartItemCard extends StatelessWidget {
  final bool onWishlist;
  final CartItem item;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  const CartItemCard({
    super.key,
    this.onWishlist = false,
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: customColors().backgroundPrimary,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 0,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    item.productItem.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/demo_icon5.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                // Product details
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productItem.name,
                        style: customTextStyle(
                          color: FontColor.FontPrimary,
                          fontStyle: FontStyle.BodyL_SemiBold,
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      Text(
                        item.productItem.name,
                        style: customTextStyle(
                          color: FontColor.FontPrimary,
                          fontStyle: FontStyle.HeaderS_SemiBold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'AED ${item.productItem.price.toStringAsFixed(0)}',
                        style: customTextStyle(
                          color: FontColor.FontPrimary,
                          fontStyle: FontStyle.HeaderXS_SemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity Selector
                Row(
                  children: [
                    if (!onWishlist)
                      QuantitySelector(
                        initialQuantity: item.quantity,
                        onChanged: onQuantityChanged,
                      ),
                    onWishlist
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/cart_icon.png"),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/wishlist_icon.png"),
                            ),
                          ),
                  ],
                ),

                InkWell(
                  onTap: onRemove,
                  child: Text(
                    "Remove",
                    style: customTextStyle(
                      fontStyle: FontStyle.BodyL_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
