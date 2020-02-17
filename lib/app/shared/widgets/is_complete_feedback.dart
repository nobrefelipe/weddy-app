import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class IsCompleteFeedback extends StatelessWidget {

  final message;
  const IsCompleteFeedback({Key key, this.message}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text("$message", textAlign: TextAlign.center,),
        SizedBox(height: 20),
        RaisedButton(
          color: AppStyles.primaryColor,
          elevation: 10,
          padding: EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
          child: Wrap(
            children: [
              SizedBox(width: 10),
              Text(
                "RETURN TO THE FEED",
                style: AppStyles.h4_white,
              ),
            ],
          ),
          onPressed: () {
            Modular.to.popUntil(ModalRoute.withName("/home"));
          },
        ),
      ],
    );
  }
}