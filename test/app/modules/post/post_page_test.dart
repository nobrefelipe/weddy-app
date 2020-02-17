import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:weddy/app/modules/post/post_page.dart';

main() {
  testWidgets('PostPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PostPage(title: 'Post')));
    final titleFinder = find.text('Post');
    expect(titleFinder, findsOneWidget);
  });
}
