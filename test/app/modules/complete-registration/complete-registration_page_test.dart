import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/complete-registration/complete-registration_page.dart';

main() {
  testWidgets('Complete-registrationPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        Complete - registrationPage(title: 'Complete-registration')));
    final titleFinder = find.text('Complete-registration');
    expect(titleFinder, findsOneWidget);
  });
}
