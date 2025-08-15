import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';

import '../../../../../services/service_locator.dart';
import '../../../../../utils/utils.dart';
import '../../../../repository/models/response/product_list_response.dart';

part 'discovery_screen_state.dart';

class DiscoveryScreenCubit extends Cubit<DiscoveryScreenState> {
  ServiceLocator serviceLocator;
  List<ProductList> productList = [];

  DiscoveryScreenCubit({required this.serviceLocator})
    : super(DiscoveryScreenLoading()) {
    sendProductListRequest();
  }

  sendProductListRequest() async {
    try {
      emit(DiscoveryScreenLoading());
      final response = await serviceLocator.apiService.sentProductListRequest();
      if (response.isNotEmpty) {
        productList.addAll(response);
        UserController().productList = productList;
      }
      emit(DiscoveryScreenInitial(productList: productList));
    } catch (e) {
      appLog(e.toString());
      emit(DiscoveryScreenError(errorMsg: e.toString()));
    }
  }
}
