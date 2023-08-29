import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/controllers/counter_controller.dart';
import 'ui/my_app.dart';

void main() {
  Get.put(CounterController());
  runApp(const MyApp());
}
