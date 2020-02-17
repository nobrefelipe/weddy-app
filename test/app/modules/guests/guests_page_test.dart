import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/guests/guests_page.dart';

main() {
  testWidgets('GuestsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GuestsPage(title: 'Guests')));
    final titleFinder = find.text('Guests');
    expect(titleFinder, findsOneWidget);
  });
}
