import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/onboarding/onboarding/onboarding_page.dart';

main() {
  testWidgets('OnboardingPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(OnboardingPage(title: 'Onboarding')));
    final titleFinder = find.text('Onboarding');
    expect(titleFinder, findsOneWidget);
  });
}
