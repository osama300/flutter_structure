import '../networking/api_error_handler.dart';
import '../networking/api_reslut.dart';
import 'api_enum.dart';
import 'api_manager.dart';
class ApiRequest {
  Future<ApiResult> call(
      {
        required String callName,
        required String apiUrl,
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
    try {
      final response = await ApiManager.instance.makeApiCall(
        callName: callName,
        apiUrl: apiUrl,
        callType: callType,
        headers: headers ??{},
        params: params??{},
        bodyType: bodyType,
        returnBody: returnBody,
        encodeBodyUtf8: encodeBodyUtf8,
        decodeUtf8: decodeUtf8,
        cache: cache,
        alwaysAllowBody: alwaysAllowBody,
      );
      return ApiResult.success(response.bodyText);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

