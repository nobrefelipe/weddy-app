import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 15.0,
      elevation: 20,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 0),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            onPressed: () => Modular.to.pushNamed("/guests"),
          ),

          /*
            Put two spaces here so the cions are spaced evenlly
          */
          SizedBox(width: 0),
          SizedBox(width: 0),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            onPressed: () async{
              /* 
                Get the current logged in user id
              */
              var userID =  ( await FirebaseAuth.instance.currentUser() ).uid;
              /*
                Navigate to the user view passing the id
              */
              Modular.to.pushNamed("/user/$userID");
            },
          ),
          SizedBox(width: 0),
        ],
      ),
    );
  }
}
