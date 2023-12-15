import 'package:f_counter_test/domain/repositories/i_counter_repository.dart';

class CounterRepository extends ICounterRepository {
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
