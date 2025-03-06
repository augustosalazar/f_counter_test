import 'package:f_counter_test/ui/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SetValueWidget extends StatefulWidget {
  const SetValueWidget({super.key});

  @override
  State<SetValueWidget> createState() => _SetValueWidgetState();
}

class _SetValueWidgetState extends State<SetValueWidget> {
  final TextEditingController _textController = TextEditingController();
  CounterController counterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      fillColor: Theme.of(context).colorScheme.primary,
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
                    onPressed: () {
                      _textController.text.isNotEmpty
                          ? counterController
                              .setValue(int.parse(_textController.text))
                          : null;
                      _textController.clear();
                    },
                    child: const Text('Set Value')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
