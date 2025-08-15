import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

part 'check_out_page_state.dart';

class CheckOutPageCubit extends Cubit<CheckOutPageState> {
  ServiceLocator serviceLocator;
  CheckOutPageCubit(this.serviceLocator) : super(CheckOutPageInitial());
}
