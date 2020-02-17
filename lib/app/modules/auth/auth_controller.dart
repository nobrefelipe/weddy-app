import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {


  //
  // OBSERVABLES
  //
  
  // EMAIL
  @observable
  String email;

  // PASSWORD
  @observable
  String password;

  // ERRORs
  @observable
  String errorMessage = "";

  //
  //  ACTIONS
  //

  // SET EMAIL
  @action
  void setEmail(String value) => email = value;

  // SET PASSWORD
  @action
  void setPassword(String value) => password = value;

  // LOGIN
  @action
  Future<bool> login() async{
    
    // Check if email is not empty
    if (email == null) {
      errorMessage = "Email is required.";
      return false;
    }

     // Check if email is a valid email
    if (!isEmailValid(email)) {
      errorMessage = "Email not valid.";
      return false;
    }

    // Check if password is not empty
    if (password == null) {
      errorMessage = "Password is required.";
      return false;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).catchError((error) {
      //Handle email already registred error
      errorMessage = error != null ? "You have entered an invalid email or password." : "";
    })).user;

    // We save the token to the device's memory
    // using Shared Preferences 
    // so we can keep the suer authenticated with the token
    var getIdToken = await user.getIdToken();
    var valid = getIdToken != null;

    return valid;
  
  }


  //
  //  HELPERS
  //

  // Email validation
  bool isEmailValid(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

}
