import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/complete_registration/complete_registration_controller.dart';
import 'package:weddy/app/modules/complete_registration/complete_registration_module.dart';

void main() {
  initModule(CompleteRegistrationModule());
  CompleteRegistrationController completeregistration;

  setUp(() {
    completeregistration =
        CompleteRegistrationModule.to.get<CompleteRegistrationController>();
  });

  group('CompleteRegistrationController Test', () {
    test("First Test", () {
      expect(
          completeregistration, isInstanceOf<CompleteRegistrationController>());
    });

    test("Set Value", () {
      expect(completeregistration.value, equals(0));
      completeregistration.increment();
      expect(completeregistration.value, equals(1));
    });
  });
}
