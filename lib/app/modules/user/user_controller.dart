import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:weddy/app/shared/models/user_model.dart';

import 'repositories/user_repository.dart';

part 'user_controller.g.dart';

class UserController = _UserBase with _$UserController;

abstract class _UserBase with Store {

  final UserRepository _userRepository;

  _UserBase(this._userRepository);


  /*
    User
  */
  @observable
  UserModel user;

  /*
    Get user by id
  */
  @action
  Future getUser(userID) async => user = await _userRepository.getUser(userID);



  
}
