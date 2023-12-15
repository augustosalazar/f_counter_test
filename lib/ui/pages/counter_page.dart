import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';
import '../widgets/set_value_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  key: const Key('counterText'),
                  '${counterController.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            const SetValueWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    key: const Key('counterResetButton'),
                    onPressed: () => counterController.reset(),
                    child: const Text('Reset'))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('counterIncrementButton'),
        onPressed: () => counterController.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
