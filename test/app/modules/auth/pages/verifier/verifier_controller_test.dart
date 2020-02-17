import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/auth/pages/verifier/verifier_controller.dart';
import 'package:weddy/app/modules/auth/pages/verifier/verifier_module.dart';

void main() {
  initModule(VerifierModule());
  VerifierController verifier;

  setUp(() {
    verifier = VerifierModule.to.get<VerifierController>();
  });

  group('VerifierController Test', () {
    test("First Test", () {
      expect(verifier, isInstanceOf<VerifierController>());
    });

    test("Set Value", () {
      expect(verifier.value, equals(0));
      verifier.increment();
      expect(verifier.value, equals(1));
    });
  });
}
