import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/set_voice_assistant_page/set_voice_assistant_page.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../widgets/custom_app_widgets/search_bar/custom_search_bar.dart';
import '../components/profile_card_widget.dart';

class ClaimProfilePage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const ClaimProfilePage(this.serviceLocator, {super.key});

  @override
  State<ClaimProfilePage> createState() => _ClaimProfilePageState();
}

class _ClaimProfilePageState extends State<ClaimProfilePage> {
  // A list to hold dummy profile data. In a real app, this would come from an API.
  final List<Profile> _profiles = List.generate(
    9,
    (index) => Profile(
      name: 'Amy Cruise',
      username: '@amycruise',
      avatarUrl: 'assets/face_avatar.png',
    ),
  );

  // A set to keep track of the indices of selected profiles.
  // Using a Set is efficient for checking if an item is selected.
  final Set<int> _selectedIndices = {
    0,
  }; // Pre-selecting the first item as in the UI

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
        // Using a Stack to layer the buttons on top of the grid
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarMain(title: "Claim Your Profile"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomSearchBar(onChanged: (value) {}),
            ),
            // The grid of profiles
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.75, // Adjust for proper item height
                ),
                itemCount: _profiles.length,
                itemBuilder: (context, index) {
                  final profile = _profiles[index];
                  final isSelected = _selectedIndices.contains(index);
                  return ProfileCard(
                    profile: profile,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        // Toggle selection logic
                        if (isSelected) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.clear();
                          _selectedIndices.add(index);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 120,
          child: Column(
            children: [
              CustomRoundedButton(
                text: "Next",
                bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                bordercolor: customColors().backgroundPrimary,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
                onpress: () {
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          SetVoiceAssistantPage(widget.serviceLocator),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              CustomRoundedButton(
                text: "Skip",
                bgcolor: customColors().backgroundPrimary,
                bordercolor: customColors().pacificBlue,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.FontPrimary,
                ),
                onpress: () {
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          SetVoiceAssistantPage(widget.serviceLocator),
                    ),
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
