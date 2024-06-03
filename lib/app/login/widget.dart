import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/controller/app_controller.dart';
import '../api/http/api_enum.dart';
import '../api/provider/api_provider.dart';
import '../api/provider/api_state.dart';
import 'controller.dart';

class ApiPageWidget extends StatefulWidget {
  const ApiPageWidget({super.key});

  @override
  State<ApiPageWidget> createState() => _ApiPageWidgetState();
}

class _ApiPageWidgetState extends State<ApiPageWidget> {
  late ApiModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApiModel());
    _model.setOnUpdate(
      updateOnChange: true,
      onUpdate: () => setState(() {}),
    );
    _model.fetchApiData();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Example')),
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          if (provider.state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.state is Success) {
            final data = (provider.state as Success).data;
            return Center(child: Text('Data: $data'));
          } else if (provider.state is Error) {
            final error = (provider.state as Error).error;
            return Center(child: Text('Error: $error'));
          } else {
            return Center(child: Text('Initial State'));
          }
        },
      ),
    );
  }
}

class AnotherApiPageWidget extends StatefulWidget {
  const AnotherApiPageWidget({super.key});

  @override
  State<AnotherApiPageWidget> createState() => _AnotherApiPageWidgetState();
}

class _AnotherApiPageWidgetState extends State<AnotherApiPageWidget> {
  late ApiModel _model;

  dynamic data2;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApiModel());
    _model.setOnUpdate(
      updateOnChange: true,
      onUpdate: () => setState(() {}),
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text('Another API Example')),
        body: Consumer<ApiProvider>(
          builder: (context, provider, child) {
            if (provider.state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (provider.state is Success) {
              final data = (provider.state as Success).data;
              _model.data=data;
              return Center(child: Text('Data: $data'));
            } else if (provider.state is Error) {
              final error = (provider.state as Error).error;
              return Center(child: Text('Error: $error'));
            } else {
              return Center(child: Text('Initial State'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ApiProvider>(context, listen: false).fetch(
              callName: 'fetchData',
              endpoint: 'https://api.example.com/data',
              callType: ApiCallType.GET,
            );
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
