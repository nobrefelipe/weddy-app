import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/user/user_page.dart';

main() {
  testWidgets('UserPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(UserPage()));
    final titleFinder = find.text('User');
    expect(titleFinder, findsOneWidget);
  });
}
