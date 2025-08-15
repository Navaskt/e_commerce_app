import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_account/components/wallet_card_widget.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_account/cubit/account_page_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../components/menu_list_item_card.dart';
import '../components/social_stats_card.dart';
import '../components/user_profile_card.dart';

class AccountPage extends StatelessWidget {
  final ServiceLocator serviceLocator;
  const AccountPage(this.serviceLocator, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountPageCubit, AccountPageState>(
      builder: (context, state) {
        if (state is AccountPageInitial) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  collapsedHeight: 90.0,
                  floating: false,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  flexibleSpace: UserProfileCard(
                    name: state.userData.name == ""
                        ? "AMA CRUIZE"
                        : state.userData.name.toUpperCase(),
                    userType: 'User',
                    imageUrl: 'assets/face_avatar.png',
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const WalletCardWidget(
                        balance: 5000,
                        expirationDays: 29,
                        imagePath: "assets/wallet_icon.png",
                        titlte: "My Coins Wallet",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Row(
                        children: [
                          Expanded(
                            child: WalletCardWidget(
                              balance: 150,
                              imagePath: "assets/influancer_icon.png",
                              titlte: "My Influencers",
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: WalletCardWidget(
                              balance: 200,
                              imagePath: "assets/subscriber_icon.png",
                              titlte: "Subscribers",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SocialStatsSection(
                        imageUrls: [
                          "assets/facebook_icon.png",
                          "assets/instagram_icon.png",
                          "assets/snap_chat_icon.png",
                          "assets/tiktok_icon.png",
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const MenuListItem(title: 'My Tools'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const MenuListItem(title: 'My Tasks'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MenuListItem(
                        title: 'Log Out',
                        onTap: () {
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                          serviceLocator.navigationService.openWelcomePage(
                            context,
                          );
                        },
                      ),
                    ),
                  ]),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 24, bottom: 8),
                //   child:
                // ),
              ],
            ),
          );
        } else if (state is AccountPageLoading) {
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
