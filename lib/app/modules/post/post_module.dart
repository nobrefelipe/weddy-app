import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/modules/post/post_controller.dart';
import 'package:weddy/app/modules/post/post_page.dart';
import 'package:weddy/app/modules/post/repositories/post_repository.dart';

import '../../app_module.dart';

class PostModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PostController(i.get<PostRepository>())),
        Bind((i) => PostRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        // Post Page receives the post id as parameter
        // so we can fetch the post by id
        Router('/:id', child: (_, args) => PostPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<PostModule>.of();
}
