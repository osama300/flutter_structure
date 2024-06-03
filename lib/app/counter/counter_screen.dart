import 'package:flutter/material.dart';
import 'package:flutter_structure/app/api/controller/app_controller.dart';
import 'counter_model.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CounterModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterModel());
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
    return Scaffold(
      appBar: AppBar(title: Text('Counter Example')),
      body: Center(
        child: Text(
          'Count: ${_model.count}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _model.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
