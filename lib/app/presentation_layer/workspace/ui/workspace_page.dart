import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_account/cubit/account_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_discovery/cubit/discovery_screen_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_discovery/home_page.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/workspace/cubit/workspace_page_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../widgets/custom_app_components/floating_chat_boat.dart';
import '../../../widgets/custom_app_widgets/appbar/custom_inner_app_bar.dart';
import '../../../widgets/custom_app_widgets/bottom_navigation_bar/custom_bottom_nav_bar.dart';
import '../../features/feature_account/ui/account_page.dart';
import '../../features/feature_restaurant/restaurant_page.dart';
import '../../features/feature_store/store_page.dart';

class DashboardPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const DashboardPage({super.key, required this.serviceLocator});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInnerAppBar(
        onTapTitle: () {},
        onTapCart: () {
          widget.serviceLocator.navigationService.openCartPage(context);
        },
        onTapWishlist: () {
          appLog(UserController().token);
          widget.serviceLocator.navigationService.openWislistPage(context);
        },
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavigationBar(
          context: context,
          onTap: (index) {
            BlocProvider.of<DashboardPageCubit>(context).updateIndex(index);
          },
          selectedIndex: selectedIndex,
        ),
      ),
      body: BlocConsumer<DashboardPageCubit, DashboardPageState>(
        listener: (context, state) {
          if (state is DashboardPageInitial) {
            switch (state.index) {
              case 0:
                selectedIndex = 0;
                break;
              case 1:
                selectedIndex = 1;
                break;
              case 2:
                selectedIndex = 2;
                break;
              case 3:
                selectedIndex = 3;
                break;
              case 4:
                selectedIndex = 4;
                break;
            }
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state is DashboardPageInitial) {
            return SafeArea(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  IndexedStack(
                    alignment: Alignment.bottomRight,
                    index: state.index,
                    children: [
                      BlocProvider(
                        create: (context) => DiscoveryScreenCubit(
                          serviceLocator: widget.serviceLocator,
                        ),
                        child: DiscoveryPage(),
                      ),

                      RestaurantPage(),
                      StorePage(),
                      StorePage(),
                      BlocProvider(
                        create: (context) =>
                            AccountPageCubit(widget.serviceLocator),
                        child: AccountPage(widget.serviceLocator),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: FloatingChatBot(onTap: () {}),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
