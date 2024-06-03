import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_structure/app/api/provider/api_provider.dart';
import 'package:flutter_structure/app/counter/counter_model.dart';
import 'package:flutter_structure/app/counter/counter_screen.dart';
import 'package:flutter_structure/app/login/widget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'app/api/http/api_enum.dart';
import 'app/api/http/api_manager.dart';
import 'app/api/http/api_response.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('API Examples'),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'API Page'),
                  Tab(text: 'Another API Page'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ChangeNotifierProvider(
                  create: (_) => ApiProvider(),
                  child: ApiPageWidget(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ApiProvider(),
                  child: AnotherApiPageWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// class UserController extends ApiProvider<User> {
//
//   Future<void> fetchUserData() async {
//     return fetchData('https://jsonplaceholder.typicode.com/users/1', (json) => User.fromJson(json));
//   }
//
// }
//
// class UserScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<UserController>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (controller.status == ApiStatus.loading)
//               CircularProgressIndicator()
//             else if (controller.status == ApiStatus.success)
//               UserWidget(user: controller.data as User)
//             else if (controller.status == ApiStatus.error)
//                 Text('Failed to load user data')
//               else
//                 Text('Initial state, press the button to fetch user data'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await controller.fetchUserData();
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
//
// class UserWidget extends StatelessWidget {
//   final User user;
//
//   UserWidget({required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('ID: ${user.id}'),
//         Text('Name: ${user.name}'),
//         // يمكنك إضافة المزيد من عناصر وتخصيص واجهة المستخدم هنا
//       ],
//     );
//   }
// }
//
// class User {
//   final int id;
//   final String name;
//
//   User({required this.id, required this.name});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
//
// enum ApiStatus { initial, loading, success, error }
//
// class ApiProvider with ChangeNotifier {
//   dynamic _data;
//   ApiStatus _status = ApiStatus.initial;
//
//   dynamic get data => _data;
//   ApiStatus get status => _status;
//
//   static Future<ApiCallResponse> call({
//     required String name,
//     required String endpoint,
//     Map<String, String>? headers,
//     Map<String, dynamic>? params,
//     required ApiCallType apiCallType,
//     BodyType? bodyType = BodyType.X_WWW_FORM_URL_ENCODED
//   }) async {
//     return ApiManager.instance.makeApiCall(
//       callName: name,
//       apiUrl: endpoint,
//       callType: apiCallType,
//       headers: headers ??{},
//       params: params??{},
//       bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       alwaysAllowBody: false,
//     );
//   }
//
//
//    Future<ApiCallResponse> fetchData(String url) async {
//     _status = ApiStatus.loading;
//     notifyListeners();
//     if (response.statusCode == 200) {
//       final dynamic jsonData = json.decode(response.body);
//       _data = fromJson(jsonData);
//       _status = ApiStatus.success;
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final dynamic jsonData = json.decode(response.body);
//         _data = fromJson(jsonData);
//         _status = ApiStatus.success;
//       } else {
//         throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       _status = ApiStatus.error;
//     }
//
//     notifyListeners();
//   }
// }
