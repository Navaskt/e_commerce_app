part of 'account_page_cubit.dart';

@immutable
sealed class AccountPageState {}

final class AccountPageInitial extends AccountPageState {
  final UserProfile userData;
  final String errorMsg;
  AccountPageInitial({required this.userData, this.errorMsg = ""});
}

final class AccountPageLoading extends AccountPageState {}


