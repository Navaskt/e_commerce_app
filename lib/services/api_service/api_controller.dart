part of 'service.dart';

const Duration timeoutDuration = Duration(seconds: 20);

class ApiController implements ApiServices {
  final String _baseUrl;

  factory ApiController(String url) => ApiController._private(url);

  ApiController._private(this._baseUrl) {
    _init();
  }
  Map<String, String> get applicationJsonHeader => {
    'Content-Type': ContentTypes.applicationJson,
  };
  Map<String, String> get applicationWithTokenJsonHeader => {
    'Content-Type': ContentTypes.applicationJson,
    'Authorization': 'Bearer ${UserController().token}',
  };

  late final http.Client _client;

  void _init() {
    _client = http.Client();
  }

  @override
  Future<Map<String, dynamic>> sendUserRegisterRequest({
    required String name,
    required String password,
    required String emaiId,
    required String referalCode,
  }) async {
    try {
      final Map<String, String> body = {
        "name": name,
        "email": emaiId,
        "password": password,
        "referalCode": referalCode,
      };
      appLog(json.encode(body));
      final url = Uri.parse(_baseUrl + EndPoints.userRegister);
      appLog(url.toString());
      final response = await _client.post(
        url,
        headers: applicationJsonHeader,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> sendUserLoginRequest({
    required String emailId,
    required String password,
  }) async {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.userLogin);
      final Map<String, dynamic> body = {
        "email": emailId,
        "password": password,
      };
      final response = await _client.post(
        url,
        headers: applicationJsonHeader,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductList>> sentProductListRequest() async {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.getProductList);

      return _handleRequest(
        onRequest: () =>
            _client.get(url, headers: applicationWithTokenJsonHeader),
        onResponse: (response) {
          return productListFromJson(response.body);
        },
      );
    } catch (e) {
      appLog(e.toString());
      rethrow;
    }
  }

  @override
  Future<ProductItem> sendAddtoCartRequest({
    required String productID,
    required int qty,
  }) {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.addToCart);
      final body = {"productId": productID, "quantity": qty};

      return _handleRequest(
        onRequest: () => _client.post(
          url,
          headers: applicationWithTokenJsonHeader,
          body: json.encode(body),
        ),
        onResponse: (response) {
          return productItemFromJson(response.body);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AllCartProductList> sendAllCartDataRequest() {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.getCart);

      return _handleRequest(
        onRequest: () =>
            _client.get(url, headers: applicationWithTokenJsonHeader),
        onResponse: (response) {
          return cartProductListFromJson(response.body);
        },
      );
    } catch (e) {
      appLog(e.toString());
      rethrow;
    }
  }

  @override
  Future<AllCartProductList> deleteCartItemRequest({
    required String productID,
  }) {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.removeFromCart + productID);

      return _handleRequest(
        onRequest: () =>
            _client.delete(url, headers: applicationWithTokenJsonHeader),
        onResponse: (response) {
          return cartProductListFromJson(response.body);
        },
      );
    } catch (e) {
      appLog(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserProfile> sendUserProfileRequest() {
    try {
      final url = Uri.parse(_baseUrl + EndPoints.getUser);

      return _handleRequest(
        onRequest: () =>
            _client.get(url, headers: applicationWithTokenJsonHeader),
        onResponse: (response) {
          return userProfileFromJson(response.body);
        },
      );
    } catch (e) {
      appLog(e.toString());
      rethrow;
    }
  }
}

Map<String, dynamic> _handleResponse(http.Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    appLog(response.body);
    return jsonDecode(response.body);
  } else if (response.statusCode == 400) {
    return jsonDecode(response.body);
  } else {
    throw Exception(response.body);
  }
}

Future<T> _handleRequest<T>({
  required Future<http.Response> Function() onRequest,
  required T Function(http.Response) onResponse,
  Duration? timeout,
}) async {
  try {
    final response = await onRequest().timeout(
      timeout ?? timeoutDuration,
      onTimeout: () => throw TimeoutException("Timeout Exception"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return onResponse(response);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      appLog(response.body);
      throw "session timeout, please relogin";
    } else {
      appLog("Network Response Error");
      throw "Network error"; //"Oops, We are having some trouble connecting";
    }
  } on SocketException {
    appLog("Socket Exception");
    throw "Network error"; //'We are having some trouble reaching the server';
  } on TimeoutException {
    appLog("Timeout Exception");
    throw 'Its taking longer than usual, please try again';
  } catch (e) {
    appLog(e.toString());
    throw e.toString();
  }
}
