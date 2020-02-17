import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:weddy/app/app_widget.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';

import 'package:weddy/app/modules/complete_registration/complete_registration_module.dart';

import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/modules/guests/guests_module.dart';
import 'package:weddy/app/modules/guests/repository/guests_repository.dart';
import 'package:weddy/app/modules/home/home_module.dart';
import 'package:weddy/app/modules/post/post_module.dart';
import 'package:weddy/app/modules/user/user_module.dart';
import 'package:weddy/app/shared/custom_classes/custom_hasura_connect.dart';

import 'modules/add-post/repositories/add_post_repository.dart';
import 'modules/auth/auth_module.dart';


class AppModule extends MainModule {


  @override
  List<Bind> get binds => [
       
        //App Controller
        Bind((i) => AppController()),

        // Guests Controller
        // inject it here(globally) because we need global access to the guests
        Bind((i) => GuestsController(i.get<GuestsRepository>())),
        // Guests Repository needs Hasura Connect so it can get the data from Hasura
        Bind((i) => GuestsRepository(i.get<HasuraConnect>())),

        Bind((i) => AddPostController(i.get<AddPostRepository>())),
        Bind((i) => AddPostRepository(i.get<HasuraConnect>())),

        // LIBS //
        // Inject Custom Hasura Connect Library, 
        // pass in  FirebaseAuth so we get the token of the logged in user on every request to hasura
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),

        // Inject the firebase auth instance of current user
        Bind((i) => FirebaseAuth.instance),
      ];

  @override
  List<Router> get routers => [
        Router('/auth', module: AuthModule()),
        Router('/complete-registration', module: CompleteRegistrationModule()),
        Router('/home', module: HomeModule()),
        Router('/post', module: PostModule()),
        Router('/user', module: UserModule()),
        Router('/guests', module: GuestsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
