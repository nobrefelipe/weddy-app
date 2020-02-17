import 'package:hasura_connect/hasura_connect.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:weddy/app/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/auth/auth_page.dart';
import 'package:weddy/app/modules/auth/pages/register/register_controller.dart';

import '../../app_module.dart';
import 'pages/register/register_page.dart';
import 'pages/verifier/repository/verifier_repository.dart';
import 'pages/verifier/verifier_controller.dart';
import 'pages/verifier/verifier_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
       
        Bind((i) => RegisterController()),
        Bind((i) => AuthController()),
        Bind((i) => VerifierController(
          firebaseAuth: i.get<FirebaseAuth>(),
          verifierRepository: i.get<VerifierRepository>()
        )),

        // Inject the firebase auth instance of current user
        Bind((i) => FirebaseAuth.instance),

        Bind((i) => VerifierRepository(AppModule.to.get<HasuraConnect>())),

      ];

  @override
  List<Router> get routers => [
        Router('/login', child: (_, args) => AuthPage()),
        Router('/register', child: (_, args) => RegisterPage()),
        Router('/verifier', child: (_, args) => VerifierPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
