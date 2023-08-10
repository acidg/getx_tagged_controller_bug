import 'package:get/get.dart';

class MyCountController extends FullLifeCycleController {
  int _count = 0;
  String name;

  MyCountController(this.name);

  int get count => _count;

  void increment() {
    _count++;
    update();
  }
}
