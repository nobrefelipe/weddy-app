import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/user_model.dart';

/*
  USER REPOSITORY
  This is where we fetch the user details and posts
*/

class UserRepository extends Disposable {
  
  /*
    HasuraConnect is injected from UserModule
  */
  final HasuraConnect _hasuraConnect;
  UserRepository(this._hasuraConnect);

  /*
    GET USER BY ID
  */
  Future<UserModel> getUser(userUID) async {

    /*
      Get User Query
    */
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

    /*
      Returns a snapshot of the User on Hasura
    */
    var  snapshot = await _hasuraConnect.query(getUserQuery, variables: {
      "userUID" : userUID
    });
    
    /*
      Transform the data to a UserModel 
    */
    return UserModel.fromJson(snapshot['data']['users_by_pk']);

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
