import 'package:flutter/material.dart';
import 'package:flutter_structure/app/api/controller/app_controller.dart';

import 'counter_screen.dart';

class CounterModel extends AppController<CounterWidget> {
  int count = 0;

  @override
  void initState(BuildContext context) {

  }

  void increment() {
    count++;
    onUpdate();
  }

  @override
  void dispose() {

  }
}
