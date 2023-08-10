import 'package:controller_injection_bug/controller/my_count_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCountWidget extends StatelessWidget {
  final String name;

  const MyCountWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCountController>(
        init: MyCountController(name),
        tag: name,
        builder: (controller) {
          assert(name == controller.name, 'tag = $name, controller.name = ${controller.name}');
          return Row(
            children: [
              Text('${controller.name}: ${controller.count}'),
              ElevatedButton(
                onPressed: controller.increment,
                child: const Text('Increment'),
              ),
            ],
          );
        });
  }
}
