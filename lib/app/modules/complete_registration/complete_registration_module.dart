  import 'package:weddy/app/modules/complete_registration/repositoriesclear_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/modules/complete_registration/complete_registration_page.dart';

import '../../app_module.dart';
import 'complete_registration_controller.dart';
import 'repositories/complete_registration_repository.dart';

class CompleteRegistrationModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => RepositoriesclearRepository()),
        // CONTROLLERS //
        // Inject the CompleteRegistrationRepository into our Home Controller
        Bind((i) => CompleteRegistrationController(i.get<CompleteRegistrationRepository>())),

        // REPOSITORIES //
        // CompleteRegistrationRepository needs Hasura Connect so it can get the data from Hasura
        // Hasura Connect is inject into AppModule so we have it globally
        Bind((i) => CompleteRegistrationRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CompleteRegistrationPage()),
      ];

  static Inject get to => Inject<CompleteRegistrationModule>.of();
}
