import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/complete_registration/complete_registration_page.dart';

main() {
  testWidgets('CompleteRegistrationPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        CompleteRegistrationPage(title: 'CompleteRegistration')));
    final titleFinder = find.text('CompleteRegistration');
    expect(titleFinder, findsOneWidget);
  });
}
