import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/auth/pages/resgister/resgister_controller.dart';
import 'package:weddy/app/modules/auth/auth_module.dart';

void main() {
  initModule(AuthModule());
  ResgisterController resgister;

  setUp(() {
    resgister = AuthModule.to.get<ResgisterController>();
  });

  group('ResgisterController Test', () {
    test("First Test", () {
      expect(resgister, isInstanceOf<ResgisterController>());
    });

    test("Set Value", () {
      expect(resgister.value, equals(0));
      resgister.increment();
      expect(resgister.value, equals(1));
    });
  });
}
