import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

/*
  CUSTOM DIALOG
  This widget displays a custom styled dialog
  Can be used whenever the app need to show a dialog 

  @param title
  @param description
  @param buttonText

*/
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 0,
            left: 10,
            right: 10,
          ),
          /*
           BOX DECORATION
           Add border radius and box shadow
          */
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          /*
           DIALOG CONTENT 
          */
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              /*
               DIALOG TITLE 
              */
              Text(
                title,
                style: AppStyles.h2_primary,
              ),
              SizedBox(height: 16.0),
              /*
                DIALOG DESCRIPTION 
              */
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 24.0),
              /*
                DIALOG OK BUTTON 
              */
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
