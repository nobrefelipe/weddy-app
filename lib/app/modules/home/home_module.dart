import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/app_module.dart';
import 'package:weddy/app/modules/home/repositories/home_repository.dart';
import 'package:weddy/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // CONTROLLERS //
        // Inject the Home Repository into our Home Controller
        Bind((i) => HomeController(i.get<HomeRepository>())),

        // REPOSITORIES //
        // Home Repository needs Hasura Connect so it can get the data from Hasura
        // Hasura Connect is inject into AppModule so we have it globally
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),

      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
