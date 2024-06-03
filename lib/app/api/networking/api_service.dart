import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  // factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
