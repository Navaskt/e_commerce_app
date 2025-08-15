import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_discovery/cubit/discovery_screen_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../constant/theme/styles.dart';

class DiscoveryScreen extends StatelessWidget {
final  ServiceLocator serviceLocator;
  const DiscoveryScreen(this.serviceLocator, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscoveryScreenCubit, DiscoveryScreenState>(
      listener: (context, state) {
        if (state is DiscoveryScreenError) {
          if (state.errorMsg != "") {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(showErrorDialogue(errorMessage: state.errorMsg));
          }
        }
      },
      builder: (context, state) {
        if (state is DiscoveryScreenInitial) {
          return Column(
            children: [
              // CustomInnerAppBar(onTapTitle: () {}),
              Expanded(
                child: ListView.builder(
                  itemCount: state.productList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final data = {"productItem": state.productList[index]};
                        serviceLocator.navigationService.openProductDetailPage(
                          context,
                          data,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            height: 364,
                            width: 500,
                            child: Image.network(
                              fit: BoxFit.fitWidth,
                              state.productList[index].image,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is DiscoveryScreenLoading) {
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
    );
  }
}
