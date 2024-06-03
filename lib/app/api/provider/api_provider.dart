import 'package:flutter/material.dart';
import 'package:flutter_structure/app/api/http/api_enum.dart';
import 'package:flutter_structure/app/api/http/api_request.dart';
import 'api_state.dart';

class ApiProvider with ChangeNotifier {

  ApiState _state = const ApiState.initial();
  ApiState get state => _state;

  void _setState(ApiState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _state = state;
      notifyListeners();
    });
  }

  void emit(ApiState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _state = state;
      notifyListeners();
    });
  }


  void fetch({
    required String callName,
    required String endpoint,
    required ApiCallType callType,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> params = const {},
    String? body,
    BodyType? bodyType =BodyType.X_WWW_FORM_URL_ENCODED,
    bool returnBody = true,
    bool encodeBodyUtf8 = false,
    bool decodeUtf8 = false,
    bool alwaysAllowBody = false,
    bool cache = false,
  }) async {
    _setState(const ApiState.loading());
    final response = await ApiRequest().call(
      callName: callName,
      apiUrl: endpoint,
      callType: callType,
    );

    response.when(success: (data) {
      _setState(ApiState.success(data));
    }, failure: (error) {
      _setState(ApiState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
