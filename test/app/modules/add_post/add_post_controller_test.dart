import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/modules/add-post/add_post_module.dart';

void main() {
  initModule(AddPostModule());
  AddPostController addpost;

  setUp(() {
    addpost = AddPostModule.to.get<AddPostController>();
  });

  group('AddPostController Test', () {
    test("First Test", () {
      expect(addpost, isInstanceOf<AddPostController>());
    });

    test("Set Value", () {
      expect(addpost.value, equals(0));
      expect(addpost.value, equals(1));
    });
  });
}
