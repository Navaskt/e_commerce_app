import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qliqmobile_jobtest/services/api_service/end_points.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../app/repository/models/response/all_cart_product_response.dart';
import '../../app/repository/models/response/product_list_response.dart';
import '../../app/repository/models/response/sigle_cart_product_response.dart';
import '../../app/repository/models/response/user_profile_response.dart';

part 'api_controller.dart';
part 'api_services.dart';
