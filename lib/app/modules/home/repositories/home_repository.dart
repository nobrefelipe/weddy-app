import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:weddy/app/shared/models/post_model.dart';

/*
  Home Repository will be responsible fet getting the data from Hasura
  We inject it on HomeController class so we can call it from there and populate our Observables
*/
class HomeRepository extends Disposable {
  // Inject Hasura Connect Dependency
  // We add this dependency from the AppModule
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);

  // SUBSCRIBE TO POSTS
  Stream<List<PostModel>> getPosts(wedding_uid) {

    var getPostsQuery = '''
        subscription postsSubscription (\$wedding_uid: uuid){
          posts (
            where: {
              wedding_owner: {
                wedding_uid: {
                  _eq: \$wedding_uid
                }
              }
            }, 
            order_by: {created_at: desc}){
            uid
            image_url
            thumbnail_url
            user {
              name
              picture
              email
              surname
              id
            }
          }
        }
      ''';
      
    Snapshot snapshot = _hasuraConnect.subscription(getPostsQuery, 
      variables:{
        "wedding_uid": wedding_uid
      }
    );

    return snapshot.map((data) => PostModel.fromJsonList(data["data"]["posts"] as List));
    
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
