import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/post_model.dart';

/*
  Home Repository will be responsible fet getting the data from Hasura
  We inject it on HomeController class so we can call it from there and populate our Observables
*/
class PostRepository extends Disposable {
  // Inject Hasura Connect Dependency
  // We add this dependency from the AppModule
  final HasuraConnect _hasuraConnect;

  PostRepository(this._hasuraConnect);

  // POSTS
  Future<PostModel> getPost(postUID) async {

    var getPostQuery = '''
        query post(\$postUID: uuid!){
          posts_by_pk(uid: \$postUID) {
          image_url
          user {
            name
            picture
            surname
            id
          }
        }
        }
      ''';

    var  snapshot = await _hasuraConnect.query(getPostQuery, variables: {
      "postUID" : postUID
    });
    return PostModel.fromJson(snapshot['data']['posts_by_pk']);

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
