import 'package:mobx/mobx.dart';
import 'package:weddy/app/shared/models/post_model.dart';

import 'repositories/post_repository.dart';

part 'post_controller.g.dart';

/*
  The post controller is responsable for the post data
  it connects with hasura and get the post by the id
*/

class PostController = _PostBase with _$PostController;

abstract class _PostBase with Store {

  final PostRepository _postRepository;
  _PostBase(this._postRepository);


  @observable
  PostModel post;

  /*
    This action is called on the init method of the post page
    it will set the post observable and return the post object
  */
  @action
  Future getPost(postUID) async => post = await _postRepository.getPost(postUID);
}
