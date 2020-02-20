import 'package:mobx/mobx.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'repositories/user_repository.dart';
part 'user_controller.g.dart';

/*
  USER CONTROLLER
  This is where we fetch the user
  and set it to the variable USER

  @observable user, user data
  @action getUser, get the user data and set it to user variable

*/
class UserController = _UserBase with _$UserController;

abstract class _UserBase with Store {

  /*
    UserRepository injected from UserModule
  */
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
