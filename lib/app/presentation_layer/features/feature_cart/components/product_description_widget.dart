import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/repository/models/response/product_list_response.dart';

import '../../../../../constant/theme/styles.dart';

class ProductDescriptionWidget extends StatelessWidget {
 final ProductList item;
  const ProductDescriptionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: customTextStyle(
                  color: FontColor.FontPrimary,
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  item.description,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: customTextStyle(
                    color: FontColor.PacificBlue,
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Airforce 01",
                  style: customTextStyle(
                    color: FontColor.FontPrimary,
                    fontStyle: FontStyle.BodyXL_SemiBold,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    item.description,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: customTextStyle(
                      color: FontColor.PacificBlue,
                      fontStyle: FontStyle.HeaderXS_SemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "In Stock",
                  style: customTextStyle(
                    color: FontColor.FontPrimary,
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                  ),
                ),
                Text(
                  "Available in 30 minutes",
                  style: customTextStyle(
                    color: FontColor.PacificBlue,
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: customColors().fontPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text("AED ${item.price}"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit.",

              style: customTextStyle(fontStyle: FontStyle.BodyL_SemiBold),
            ),
          ),
        ],
      ),
    );
  }
}
