import 'package:flutter/material.dart';
import 'package:flutter_structure/app/api/controller/app_controller.dart';
import 'package:flutter_structure/app/login/widget.dart';
import 'package:provider/provider.dart';
import '../api/http/api_enum.dart';
import '../api/provider/api_provider.dart';
import '../api/provider/api_state.dart';

class ApiModel extends AppController<ApiPageWidget> {
  late ApiProvider apiProvider;

  dynamic data;

  @override
  void initState(BuildContext context) {
    print(data.toString());
    apiProvider = Provider.of<ApiProvider>(context, listen: false);
  }

  void fetchApiData()
  {
    apiProvider.emit(ApiState.loading());
    apiProvider.fetch(
      callName: 'fetchData',
      endpoint: 'https://tyma.cloud/news.php',
      callType: ApiCallType.GET,
      params: {

      }
    );

  }

  ApiState get apiState => apiProvider.state;

  @override
  void dispose() {
    // apiProvider.dispose();
  }
}
