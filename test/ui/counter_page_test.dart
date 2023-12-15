import 'package:f_counter_test/data/repositories/counter_repository.dart';
import 'package:f_counter_test/domain/repositories/i_counter_repository.dart';
import 'package:f_counter_test/domain/use_cases/counter_use_case.dart';
import 'package:f_counter_test/ui/controllers/counter_controller.dart';
import 'package:f_counter_test/ui/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

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

class MockCounterController extends GetxService
    with Mock
    implements CounterController {
  final _counter = 0.obs;

  @override
  int get counter => _counter.value;

  @override
  void increment() {
    _counter.value = _counter.value + 1;
  }

  @override
  void decrement() {
    _counter.value = _counter.value - 1;
  }

  @override
  void reset() {
    _counter.value = 0;
  }

  @override
  void setValue(int value) {
    _counter.value = value;
  }
}

void main() {
  setUp(() {
    Get.put<ICounterRepository>(FakeCounterRepository());
    Get.put(CounterUseCase(Get.find()));
  });
  testWidgets('Counter increments', (WidgetTester tester) async {
    Get.put<CounterController>(MockCounterController(), permanent: true);

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter increments with keys', (WidgetTester tester) async {
    Get.replace<CounterController>(MockCounterController());

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        '0');

    await tester.tap(find.byKey(const Key('counterIncrementButton')));
    await tester.pump();

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        '1');
  });

  testWidgets('Counter set value', (WidgetTester tester) async {
    Get.replace<CounterController>(MockCounterController());

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "5");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        "5");
  });

  testWidgets('Counter reset value', (WidgetTester tester) async {
    Get.replace<CounterController>(MockCounterController());

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "5");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "5");

    await tester.tap(find.byKey(const Key('counterResetButton')));
    await tester.pump();

    expect(
        (find.byKey(const Key('counterText')).evaluate().single.widget as Text)
            .data,
        "0");
  });
}
