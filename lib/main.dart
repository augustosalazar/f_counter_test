import 'package:f_counter_test/domain/repositories/i_counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/repositories/counter_repository.dart';
import 'domain/use_cases/counter_use_case.dart';
import 'ui/controllers/counter_controller.dart';
import 'ui/my_app.dart';

void main() {
  Get.put<ICounterRepository>(CounterRepository());
  Get.put(CounterUseCase(Get.find()));
  Get.put(CounterController());
  runApp(const MyApp());
}
