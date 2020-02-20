import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

/*
  IS COMPLETE FEEDBACK
  This widget is displayed after the upload and download  of a picture is completed.
  It renders:
  1. A feedback text passed as parameter
  2. A button to return to the home screen

  @param message, the message the widget will display
  
*/
class IsCompleteFeedback extends StatelessWidget {
  final message;
  const IsCompleteFeedback({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*
          Feedback message
        */
        Text(
          "$message",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        /*
          Button
        */
        RaisedButton(
          color: AppStyles.primaryColor,
          elevation: 10,
          padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
          /*
            Let's make it rounded
          */
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0)),
          child: Text(
            "RETURN TO THE FEED",
            style: AppStyles.h4_white,
          ),
          /*
            On pressed, return to home screen
          */
          onPressed: () {
            Modular.to.popUntil(ModalRoute.withName("/home"));
          },
        ),
      ],
    );
  }
}
