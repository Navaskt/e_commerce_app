import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

part 'wishlist_page_state.dart';

class WishlistPageCubit extends Cubit<WishlistPageState> {
  ServiceLocator serviceLocator;
  WishlistPageCubit(this.serviceLocator) : super(WishlistPageInitial());
}
