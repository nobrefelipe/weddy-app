import 'package:weddy/app/modules/user/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/user/user_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UserPage()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
