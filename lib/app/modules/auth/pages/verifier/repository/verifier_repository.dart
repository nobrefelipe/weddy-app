import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/user_model.dart';

class VerifierRepository extends Disposable {
  // Inject Hasura Connect Dependency
  // We add this dependency from the AppModule
  final HasuraConnect _hasuraConnect;
  VerifierRepository(this._hasuraConnect);

  // GET GUESTS
  Future<String> getWedding(weddingCode) async {
    var getUsersQuery = r'''
        query getWedding($wedding_passcode: String) {
          weddings(
            where: {
              wedding_passcode: {
                _eq: $wedding_passcode
                }
              }
          ) {
            wedding_uid
          }
        }

      ''';

    var snapshot = await _hasuraConnect.query(getUsersQuery, variables: {
      "wedding_passcode": weddingCode
    });

    var weddings = snapshot['data']['weddings'];

    if(weddings.length > 0){

      return weddings[0]['wedding_uid'];

    }else{

      return "error";

    }

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
