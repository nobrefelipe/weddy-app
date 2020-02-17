import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _ResgisterBase with _$RegisterController;

abstract class _ResgisterBase with Store {

  //
  // OBSERVABLES
  //

  // EMAIL
  @observable
  String email;

  // PASSWORD
  @observable
  String password;

  // CONFIRM PASSWORD
  @observable
  String confirmPassword;

  // ERRORs
  @observable
  String errorMessage = "";

  // CREATED USER ID
  String userID = "";

  //
  // ACTIONS
  //

  // SET EMAIL
  @action
  void setEmail(String value) {
    errorMessage = "";
    email = value;
  }

  // SET PASSWORD
  @action
  void setPassword(String value) {
    errorMessage = "";
    password = value;
  }

  // SET PASSWORD
  @action
  void setConfirmPassword(String value) {
    errorMessage = "";
    confirmPassword = value;
  }

  // LOGIN
  @action
  Future<bool> register() async {
    // Check if email is not empty
    if (email == null) {
      _setError("Email is required.");
      return false;
    }

    // Check if email is a valid email
    if (!isEmailValid(email)) {
      _setError("Email not valid.");
      return false;
    }

    // Check if password is not empty
    if (password == null) {
      _setError("Password is required.");
      return false;
    }

    // Check password min lengh
    if (password.length < 6) {
      _setError("Password must have more than 6 characters.");
      return false;
    }

    // Check if Field
    if (confirmPassword != password) {
      _setError("Passwords dont match.");
      return false;
    }


    /*
      The creation of the user is managed by firebase
      We also need to set some configurations for Hasura upon user's creation  
      This is managed by a Firebase Cloud Function
      for each user we set this so whe the user logs in we get the token that can comunicate
      with Hasura:
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-roles": ["user"],
        "x-hasura-user-id": user.uid
      }
      this function is placed at ___FLUTTER/WEDDY/functions
    */
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth
            .createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).catchError((error) {
      //Handle email already registred error
      errorMessage = 
          (error.code == "ERROR_EMAIL_ALREADY_IN_USE")
          ? "This email is already registred."
          : "";
    })).user;

    // user id  - used  on the finish registration page
    userID = user.uid;

    // We save the token to the device's memory
    // using Shared Preferences 
    // so we can keep the suer authenticated with the token
    var getIdToken = await user.getIdToken();
    var valid = getIdToken != null;

    return valid;
  }

  //
  // GENERIC HELPERS
  //

  // Set error message
  String _setError(String value) => errorMessage = value;

  // Email validation
  bool isEmailValid(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}



// A pagina inicial do app vai ser a pagina que checa se esta logado ou nao
// se tiver logado => vai pra pagina para fornecer o codigo do casamento
// se nao tiver logado => vai pra pagina login



// criar a tela de transicao depois do login
// Essa tela vai ser responsavel por dizer se o usuarioe sta logado ou nao
// sera usada sempre pra checar se esta logado

// depois da registracao mando para uma tela de completar o perfil
// na registracao o uuario eh criado no firebase
// entao nessa nova tela eu pego o nome e sobrenome e talvez a foto 
// do usuario e crio ele no hasura, passando como id o id gerado pelo firebase
// logo apos isso eu mando pra tela que pede o codigo do casamento 
// (essa tela sera usada tb sempre logo apos o login ser efetuado)

// VOu ter que mudar o uuid no hasura para uma string 
// pq o firebase gera id como string e nao no formato uuid