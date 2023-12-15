import 'package:f_counter_test/data/repositories/counter_repository.dart';
import 'package:f_counter_test/domain/repositories/i_counter_repository.dart';
import 'package:f_counter_test/domain/use_cases/counter_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class FakeCounterRepository extends Fake implements CounterRepository {
  int _counter = 0;

  @override
  int incrementCounter() => ++_counter;

  @override
  int decrementCounter() => --_counter;

  @override
  int resetCounter() {
    _counter = 0;
    return _counter;
  }

  @override
  int setCounter(int value) {
    _counter = value;
    return _counter;
  }

  @override
  int getCounter() => _counter;
}

void main() {
  group('Counter', () {
    late CounterUseCase counter;

    setUp(() {
      Get.put<ICounterRepository>(FakeCounterRepository());
      counter = CounterUseCase(Get.find());
    });

    test('reset should set the counter to 0', () {
      expect(counter.reset(), 0);
    });

    test('setCounter should set the counter to 5', () {
      expect(counter.setCounter(5), 5);
    });

    test('increment should increase the counter by 1', () {
      expect(counter.increment(), 6);
    });

    test('reset should set the counter to 0', () {
      expect(counter.reset(), 0);
    });
  });
}
