import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddPostRepository extends Disposable {
  // Inject Hasura Connect Dependency
  // We add this dependency from the AppModule
  final HasuraConnect _hasuraConnect;

  AddPostRepository(this._hasuraConnect);


  // ADD POSTS
  Future<bool> addPost(wedding_owner_id, image, authorID, thumbnailUrl) async {
    var mutation = '''
    mutation MyMutation(
      \$wedding_uid: uuid, 
      \$thumbnailUrl: String, 
      \$imagePath: String, 
      \$authorID: String
    ) {
      insert_posts(objects: {
        author_uid: \$authorID,
        image_url: \$imagePath,
        thumbnail_url: \$thumbnailUrl,
        wedding_uid: \$wedding_uid
      }) {
        affected_rows
      }
    }

    ''';
  
    var snapshot = await _hasuraConnect
        .mutation(mutation, variables: {
          "imagePath": image,
          "thumbnailUrl": thumbnailUrl,
          "authorID": authorID,
          "wedding_uid": wedding_owner_id
        }).catchError( (err) => print(err));

    return snapshot["data"]["insert_posts"]["affected_rows"] > 0;

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
