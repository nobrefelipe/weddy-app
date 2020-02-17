
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/widgets/add_new_post_dialog.dart';

class AddPostModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //include the add post repository and add post controller from the app module
        // because wee need the add post controller from the add post button 
      ];

  @override
  List<Router> get routers => [
    // Router('/', child: (_, args) => AddNewPostDialog()),
  ];

  static Inject get to => Inject<AddPostModule>.of();
}
