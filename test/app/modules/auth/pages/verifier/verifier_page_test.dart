import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/auth/pages/verifier/verifier_page.dart';

main() {
  testWidgets('VerifierPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(VerifierPage(title: 'Verifier')));
    final titleFinder = find.text('Verifier');
    expect(titleFinder, findsOneWidget);
  });
}
