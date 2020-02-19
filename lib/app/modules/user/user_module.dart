import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/app_module.dart';
import 'package:weddy/app/modules/user/repositories/user_repository.dart';
import 'package:weddy/app/modules/user/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/user/user_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController(i.get<UserRepository>())),
        Bind((i) => UserRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        // Post Page receives the post id as parameter
        // so we can fetch the post by id
        Router('/:id', child: (_, args) => UserPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<UserModule>.of();
}
