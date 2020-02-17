import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repository/verifier_repository.dart';

part 'verifier_controller.g.dart';

class VerifierController = _VerifierBase with _$VerifierController;

abstract class _VerifierBase with Store {

  final FirebaseAuth firebaseAuth;
  final VerifierRepository verifierRepository;
  
  _VerifierBase({
    this.firebaseAuth,
    this.verifierRepository
  });

  String weddingID;

  @observable
  String errorMessage = "";
  
  @action
  Future<bool> checkLogin() async{

   // Get current logged in used
    var loggedUser = await firebaseAuth.currentUser();

    return loggedUser != null;
    
  }

  /*
    GET THE WEDDING BY CODE
    The user inputs the wedding code 
    we fetch hasura to get the wedding when wedding_code = code
  */
  @action
  Future<void> getWeddingByCode(weddingCode) async {

    var weddingUID =  await verifierRepository.getWedding(weddingCode);

    if(weddingUID == "error"){

      errorMessage = "Please check if the code is correct.";
      
      return false;
    }

    weddingID = weddingUID;

    Modular.to.pushReplacementNamed("/home");

  }
}
