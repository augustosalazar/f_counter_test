// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_counter_test/ui/controllers/counter_controller.dart';
import 'package:f_counter_test/ui/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

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
  testWidgets('Counter increments', (WidgetTester tester) async {
    MockCounterController mockCounterController = MockCounterController();

    Get.put<CounterController>(mockCounterController, permanent: true);

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    Get.deleteAll();
  });

  testWidgets('Counter increments with keys', (WidgetTester tester) async {
    MockCounterController mockCounterController = MockCounterController();

    Get.replace<CounterController>(mockCounterController);

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, '0');

    await tester.tap(find.byKey(const Key('counterIncrementButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, '1');

    Get.deleteAll();
  });

  testWidgets('Counter set value', (WidgetTester tester) async {
    MockCounterController mockCounterController = MockCounterController();

    Get.replace<CounterController>(mockCounterController);

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "5");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "5");

    Get.deleteAll();
  });

  testWidgets('Counter reset value', (WidgetTester tester) async {
    MockCounterController mockCounterController = MockCounterController();

    Get.replace<CounterController>(mockCounterController);

    await tester.pumpWidget(const GetMaterialApp(home: CounterPage()));

    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "5");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "5");

    await tester.tap(find.byKey(const Key('counterResetButton')));
    await tester.pump();

    final counterText3 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText3.data, "0");

    Get.deleteAll();
  });
}
