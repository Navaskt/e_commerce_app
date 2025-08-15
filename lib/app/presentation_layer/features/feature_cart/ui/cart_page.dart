import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/cubit/cart_page_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_inner_app_bar.dart';
import '../components/cart_item_card.dart';
import '../components/check_out_button_widget.dart';

class CartPage extends StatelessWidget {
  final ServiceLocator serviceLocator;
  final bool selected;
  const CartPage({
    super.key,
    this.selected = false,
    required this.serviceLocator,
  });

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
        child: BlocConsumer<CartPageCubit, CartPageState>(
          listener: (context, state) {
            if (state is CartPageInitial) {
              if (state.errorMsg != "") {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(showErrorDialogue(errorMessage: state.errorMsg));
              }
            }
          },
          builder: (context, state) {
            if (state is CartPageInitial) {
              return state.allCartData.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.allCartData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          item: state.allCartData[index],
                          onQuantityChanged: (qty) {
                            BlocProvider.of<CartPageCubit>(
                              context,
                            ).sendAddProductToCartReq(
                              state.allCartData[index].id,
                              qty,
                            );
                          },
                          onRemove: () {
                            BlocProvider.of<CartPageCubit>(
                              context,
                            ).removeProductFromCart(
                              state.allCartData[index].id,
                            );
                          },
                        );
                      },
                    )
                  : Center(child: Text("Cart is empty"));
            } else if (state is CartPageLoading) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: customColors().pacificBlue,
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartPageCubit, CartPageState>(
        builder: (context, state) {
          if (state is CartPageInitial) {
            if (state.allCartData.isNotEmpty) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CheckOutButtonWidget(
                    title: "Checkout",
                    amount: "5000",
                    onPressed: () {
                      serviceLocator.navigationService.openCheckOutPage(
                        context,
                      );
                    },
                  ),
                ),
              );
            }
          }
          return SizedBox();
        },
      ),
    );
  }
}
