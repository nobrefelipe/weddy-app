import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/post_model.dart';
import 'package:weddy/app/shared/models/user_model.dart';

class UserRepository extends Disposable {
  
  final HasuraConnect _hasuraConnect;
  UserRepository(this._hasuraConnect);

  // GET USER BY ID
  Future<UserModel> getUser(userUID) async {

    var getUserQuery = r'''
        query user($userUID: String!){
          users_by_pk(id: $userUID) {
            id
            email
            name
            surname
            picture
            posts {
              thumbnail_url
              uid
            }
          }
        }
      ''';

    var  snapshot = await _hasuraConnect.query(getUserQuery, variables: {
      "userUID" : userUID
    });
    
    return UserModel.fromJson(snapshot['data']['users_by_pk']);

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
