import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CompleteRegistrationRepository extends Disposable {
 
  final HasuraConnect _hasuraConnect;
  CompleteRegistrationRepository(this._hasuraConnect);


  // ADD POSTS
  Future<bool> addUser(name, surname, id, email, picture) async {
    var mutation = '''
    mutation MyMutation(
      \$email: String, 
      \$name: String, 
      \$id: String, 
      \$surname: String, 
      \$picture: String
    ) {
      insert_users(objects: {
        email: \$email, 
        id: \$id, 
        name: \$name, 
        picture: \$picture, 
        surname: \$surname
      }) {
        affected_rows
      }
    }
    ''';

    var snapshot = await _hasuraConnect
        .mutation(mutation, variables: {
          "name": name,
          "surname": surname,
          "id": id,
          "email": email,
          "picture": picture
        }).catchError( (err) => print(err));


    return snapshot["data"]["insert_users"]["affected_rows"] > 0;

  }


  //dispose will be called automatically
  @override
  void dispose() {}
}
