import 'package:mobx/mobx.dart';

import 'repositories/complete_registration_repository.dart';

part 'complete_registration_controller.g.dart';

class CompleteRegistrationController = _CompleteRegistrationBase
    with _$CompleteRegistrationController;
    
abstract class _CompleteRegistrationBase with Store {

  final CompleteRegistrationRepository _completeRegistrationRepository;
  _CompleteRegistrationBase(this._completeRegistrationRepository);

  String name;

  String surname;

  String picture;

  // ERROR
  @observable
  String errorMessage = "";

  // SET NAME
  @action
  void setName(String value) {
    errorMessage = "";
    name = value;
  }

  // SET SURNAME
  @action
  void setSurname(String value) {
    errorMessage = "";
    surname = value;
  }

  @action
  Future<bool> finishRegistration(userID, userEmail) async {
    // Check if email is not empty
    if (name == null) {
      errorMessage = "Name is required";
      return false;
    }

    // Check if email is a valid email
    if (surname == null) {
      errorMessage = "Surname is required";
      return false;
    }

    return await _completeRegistrationRepository.addUser(name, surname, userID, userEmail, 'picture');
  
  }
}
