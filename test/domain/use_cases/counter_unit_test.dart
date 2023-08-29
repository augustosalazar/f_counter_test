import 'package:f_counter_test/domain/use_cases/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('increment should increase the counter by 1', () {
      expect(counter.increment(3), 4);
    });

    test('reset should set the counter to 0', () {
      expect(counter.reset(), 0);
    });
  });
}
