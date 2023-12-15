import 'package:get/get.dart';

import '../../domain/use_cases/counter_use_case.dart';

class CounterController extends GetxController {
  final _counter = 0.obs;
  final CounterUseCase _counterUseCase = Get.find();

  int get counter => _counter.value;

  void increment() {
    _counter.value = _counterUseCase.increment();
  }

  void decrement() {
    _counter.value = _counterUseCase.decrement();
  }

  void reset() {
    _counter.value = _counterUseCase.reset();
  }

  void setValue(int value) {
    _counter.value = _counterUseCase.setCounter(value);
  }
}
