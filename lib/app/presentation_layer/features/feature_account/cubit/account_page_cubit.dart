import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qliqmobile_jobtest/app/repository/models/response/user_profile_response.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

part 'account_page_state.dart';

class AccountPageCubit extends Cubit<AccountPageState> {
  ServiceLocator serviceLocator;
  UserProfile? userProfile;

  AccountPageCubit(this.serviceLocator) : super(AccountPageLoading()) {
    fetchUserProfileData();
  }

  fetchUserProfileData() async {
    try {
      if (!isClosed) {
        emit(AccountPageLoading());
      }
      userProfile = await serviceLocator.apiService.sendUserProfileRequest();

      if (userProfile != null && userProfile!.id != "") {
        if (isClosed) return;
        emit(AccountPageInitial(userData: userProfile!));
      }
    } catch (e) {
      if (isClosed) return;
      emit(AccountPageInitial(userData: userProfile!, errorMsg: e.toString()));
    }
  }
}
