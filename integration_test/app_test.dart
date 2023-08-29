import 'package:f_counter_test/ui/controllers/counter_controller.dart';
import 'package:f_counter_test/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments', (WidgetTester tester) async {
    Get.put(CounterController());
    await tester.pumpWidget(const MyApp());

    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    Get.deleteAll();
  });

  testWidgets('Counter increments with keys', (WidgetTester tester) async {
    Get.put(CounterController());
    await tester.pumpWidget(const MyApp());

// Verify that our counter starts at 0.
    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, "0");

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "1");

    Get.deleteAll();
  });

  testWidgets('Counter set value', (WidgetTester tester) async {
    Get.put(CounterController());
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "4");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "4");

    Get.deleteAll();
  });

  testWidgets('Counter reset value', (WidgetTester tester) async {
    Get.put(CounterController());
    await tester.pumpWidget(const MyApp());
    // Verify that our counter starts at 0.
    final counterText =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText.data, "0");

    await tester.enterText(find.byKey(const Key('counterTextField')), "4");

    await tester.tap(find.byKey(const Key('counterSetButton')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('counterResetButton')));
    await tester.pump();

    final counterText2 =
        find.byKey(const Key('counterText')).evaluate().single.widget as Text;
    expect(counterText2.data, "0");
    Get.deleteAll();
  });
}
