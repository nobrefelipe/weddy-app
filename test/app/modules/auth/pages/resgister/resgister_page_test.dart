import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/auth/pages/resgister/resgister_page.dart';

main() {
  testWidgets('ResgisterPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ResgisterPage(title: 'Resgister')));
    final titleFinder = find.text('Resgister');
    expect(titleFinder, findsOneWidget);
  });
}
