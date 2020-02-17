import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/complete-registration/complete-registration_controller.dart';
import 'package:weddy/app/modules/complete-registration/complete-registration_module.dart';

void main() {

  initModule(Complete-registrationModule());
  Complete-registrationController complete-registration;
  
  setUp(() {
      complete-registration = Complete-registrationModule.to.get<Complete-registrationController>();
  });

  group('Complete-registrationController Test', () {
    test("First Test", () {
      expect(complete-registration, isInstanceOf<Complete-registrationController>());
    });

    test("Set Value", () {
      expect(complete-registration.value, equals(0));
      complete-registration.increment();
      expect(complete-registration.value, equals(1));
    });
  });

}
  