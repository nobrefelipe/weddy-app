import 'package:mobx/mobx.dart';
import 'package:weddy/app/shared/models/post_model.dart';

import 'repositories/post_repository.dart';

part 'post_controller.g.dart';

class PostController = _PostBase with _$PostController;

abstract class _PostBase with Store {

  final PostRepository _postRepository;

  _PostBase(this._postRepository);


  @observable
  PostModel post;

  @action
  Future getPost(postUID) async => post = await _postRepository.getPost(postUID);
}
