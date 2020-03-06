import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/onboarding/onboarding/onboarding_controller.dart';
import 'package:weddy/app/modules/onboarding/onboarding/onboarding_module.dart';

void main() {
  initModule(OnboardingModule());
  OnboardingController onboarding;

  setUp(() {
    onboarding = OnboardingModule.to.get<OnboardingController>();
  });

  group('OnboardingController Test', () {
    test("First Test", () {
      expect(onboarding, isInstanceOf<OnboardingController>());
    });

    test("Set Value", () {
      expect(onboarding.value, equals(0));
      onboarding.increment();
      expect(onboarding.value, equals(1));
    });
  });
}
