import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

/*
  CUSTON HASURA CONNECT
  create a wrapper for the HasuraConnect class
  this way we can validate the user on every request
*/
class CustomHasuraConnect {
  
  static HasuraConnect getConnect(FirebaseAuth auth) {

      return HasuraConnect(
        "https://weddy-hasura-app.herokuapp.com/v1/graphql",

          token: (_) async {
            
            // Get current logged in used
            var loggedUser = await auth.currentUser();

            // Get refreshed token
            var token = await loggedUser.getIdToken(refresh: true);

            // If token is valid proceed
            if(token != null){
              
              return 'Bearer ${token.token}';

            }
            // otherwise redirect to login page
            else{

              Modular.to.pushReplacementNamed('/auth/login');

            }
            

          } 
        );

  }
}
