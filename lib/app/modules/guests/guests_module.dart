
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/guests/guests_page.dart';

class GuestsModule extends ChildModule {
  @override
  List<Bind> get binds => [ ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => GuestsPage()),
      ];

  static Inject get to => Inject<GuestsModule>.of();
}
