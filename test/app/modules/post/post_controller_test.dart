import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/post/post_controller.dart';
import 'package:weddy/app/modules/post/post_module.dart';

void main() {
  initModule(PostModule());
  PostController post;

  setUp(() {
    post = PostModule.to.get<PostController>();
  });

  group('PostController Test', () {
    test("First Test", () {
      expect(post, isInstanceOf<PostController>());
    });

    test("Set Value", () {
      expect(post.value, equals(0));
      post.increment();
      expect(post.value, equals(1));
    });
  });
}
