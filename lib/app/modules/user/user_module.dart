import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/app_module.dart';
import 'package:weddy/app/modules/user/repositories/user_repository.dart';
import 'package:weddy/app/modules/user/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/user/user_page.dart';

/*
  USER MODULE
  This is where we inject the DEPENDENCIES and create ROUTES 
*/
class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        /*
          UserController needs the UserRepository to fetch the user
        */
        Bind((i) => UserController(i.get<UserRepository>())),
        /*
          UserRepository needs HasuraConnect 
          to connect with hasura and fetch the user
        */
        Bind((i) => UserRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        /*
          User Page receives the user id as parameter
          so we can fetch the user by id
        */
        Router('/:id', child: (_, args) => UserPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<UserModule>.of();
}
