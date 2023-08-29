import 'package:get/get.dart';

import '../../domain/use_cases/counter.dart';

class CounterController extends GetxController {
  final _counter = 0.obs;
  late Counter _counterUseCase;

  @override
  void onInit() {
    super.onInit();
    _counterUseCase = Counter();
  }

  int get counter => _counter.value;

  void increment() {
    _counter.value = _counterUseCase.increment(_counter.value);
  }

  void decrement() {
    _counter.value = _counterUseCase.decrement(_counter.value);
  }

  void reset() {
    _counter.value = _counterUseCase.reset();
  }

  void setValue(int value) {
    _counter.value = value;
  }
}
