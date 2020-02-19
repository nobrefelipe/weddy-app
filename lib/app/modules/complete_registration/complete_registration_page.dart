import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weddy/app/modules/auth/auth_module.dart';
import 'package:weddy/app/modules/auth/pages/register/register_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/logo.dart';

import 'complete_registration_controller.dart';
import 'complete_registration_module.dart';

class CompleteRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller =
        CompleteRegistrationModule.to.get<CompleteRegistrationController>();

    final _registerController = AuthModule.to.get<RegisterController>();

    final _screenSize = MediaQuery.of(context).size;
    final _appBarHeight = 115;

    return Scaffold(
      appBar: AppBar(
        title: WeddayLogo(),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Container(
          width: _screenSize.width,
          height: _screenSize.height - _appBarHeight,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Please provide you name and surname",
                  style: AppStyles.h2_primary,
                ),
                SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Text(
                      "${_controller.errorMessage}",
                      style: AppStyles.error_text,
                    );
                  },
                ),
                SizedBox(height: 20),

                //
                // NAME FIELD
                CupertinoTextField(
                  placeholder: "Name",
                  padding: EdgeInsets.all(15),
                  placeholderStyle: AppStyles.body_text,
                  style: AppStyles.body_text,
                  decoration: BoxDecoration(color: Colors.white),
                  onChanged: (val) => _controller.setName(val),
                ),
                SizedBox(height: 20),
                //
                // SURNAME FIELD
                CupertinoTextField(
                  placeholder: "Surname",
                  padding: EdgeInsets.all(15),
                  placeholderStyle: AppStyles.body_text,
                  style: AppStyles.body_text,
                  decoration: BoxDecoration(color: Colors.white),
                  onChanged: (val) => _controller.setSurname(val),
                ),
                SizedBox(height: 20),

                //
                // LOGIN BUTTON
                CupertinoButton.filled(
                  child: Text("FINISH REGISTRATION"),
                  borderRadius: BorderRadius.circular(40),
                  onPressed: () async {
                    // Finish the registration
                    var registred = await _controller.finishRegistration(
                        _registerController.userID, _registerController.email);

                    // If all good, navigate to the home page
                    if (registred) {
                      Navigator.of(context)
                          .pushReplacementNamed('/auth/verifier');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
