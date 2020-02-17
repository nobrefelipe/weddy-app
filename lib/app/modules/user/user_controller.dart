import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserBase with _$UserController;

abstract class _UserBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
