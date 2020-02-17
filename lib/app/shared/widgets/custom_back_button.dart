import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

// CUSTOM BACK BUTTON
class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 10,
      child: RaisedButton(
        color: Colors.white,
        elevation: 15,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppStyles.primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Back",
              style: AppStyles.body_text,
            ),
          ],
        ),
        onPressed: () => Modular.to.pop(),
      ),
    );
  }
}
