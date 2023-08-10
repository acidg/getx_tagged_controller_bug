import 'package:get/get.dart';

class MySwitchController extends FullLifeCycleController {
  bool _value = false;
  String name;

  MySwitchController(this.name);

  bool get value => _value;

  void toggle() => _value = !_value;
}