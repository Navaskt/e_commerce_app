import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workspace_page_state.dart';

class DashboardPageCubit extends Cubit<DashboardPageState> {
  int preIndex = 0;
  DashboardPageCubit() : super(DashboardPageInitial());

  updateIndex(int index) {
    emit(DashboardPageInitial(index: index));

    preIndex = index;
  }
}
