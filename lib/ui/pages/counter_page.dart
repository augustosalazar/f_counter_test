import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController _textController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          key: const Key('counterTextField'),
                          controller: _textController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.background,
                              border: const OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            key: const Key('counterSetButton'),
                            onPressed: () => _textController.text.isNotEmpty
                                ? counterController
                                    .setValue(int.parse(_textController.text))
                                : null,
                            child: const Text('Set Value')),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
