part of 'workspace_page_cubit.dart';

@immutable
sealed class DashboardPageState {}

final class DashboardPageInitial extends DashboardPageState {
  final int index;

  DashboardPageInitial({this.index = 0});
}
