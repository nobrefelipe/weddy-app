import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/modules/guests/guests_module.dart';

void main() {
  initModule(GuestsModule());
  GuestsController guests;

  setUp(() {
    guests = GuestsModule.to.get<GuestsController>();
  });

  group('GuestsController Test', () {
    test("First Test", () {
      expect(guests, isInstanceOf<GuestsController>());
    });

    test("Set Value", () {
      expect(guests.value, equals(0));
      guests.increment();
      expect(guests.value, equals(1));
    });
  });
}
