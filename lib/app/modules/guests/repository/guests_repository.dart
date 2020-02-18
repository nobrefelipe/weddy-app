import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/user_model.dart';

/*
  Guests Repository will be responsible for getting the data from Hasura
  We inject it on GuestsController class so we can call it from there and populate our Observables
*/
class GuestsRepository extends Disposable {
  // Inject Hasura Connect Dependency
  // We add this dependency from the AppModule
  final HasuraConnect _hasuraConnect;
  GuestsRepository(this._hasuraConnect);

  // GET GUESTS
  Stream<List<UserModel>> getGuests() {
    var getUsersQuery = '''
        subscription GuestsSubscription {
          users {
            name
            id
            surname
            picture
          }
        }
      ''';

    var snapshot = _hasuraConnect.subscription(getUsersQuery);

    var data =  snapshot.map((data) => UserModel.fromJsonList(data["data"]["users"] as List));

    return data;

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
