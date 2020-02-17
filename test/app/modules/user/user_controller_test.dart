import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/user/user_controller.dart';
import 'package:weddy/app/modules/user/user_module.dart';

void main() {
  initModule(UserModule());
  UserController user;

  setUp(() {
    user = UserModule.to.get<UserController>();
  });

  group('UserController Test', () {
    test("First Test", () {
      expect(user, isInstanceOf<UserController>());
    });

    test("Set Value", () {
      expect(user.value, equals(0));
      user.increment();
      expect(user.value, equals(1));
    });
  });
}
