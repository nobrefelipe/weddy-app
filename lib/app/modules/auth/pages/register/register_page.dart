import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:weddy/app/shared/styles/app_styles.dart';

import 'package:weddy/app/shared/widgets/logo.dart';

import '../../auth_module.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Resgister"}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {

    final _controller =  AuthModule.to.get<RegisterController>();

    final _screenSize = MediaQuery.of(context).size;
    final _appBarHeight = 115;

    return Scaffold(
      appBar: AppBar(
        title: WeddayLogo(),
        backgroundColor: Colors.white,
        elevation: 0,
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
                  "Register to weddy",
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
                // EMAIL FIELD
                CupertinoTextField(
                  placeholder: "Email",
                  padding: EdgeInsets.all(15),
                  keyboardType: TextInputType.emailAddress,
                  placeholderStyle: AppStyles.body_text,
                  style: AppStyles.body_text,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  onChanged: (val) => _controller.setEmail(val),
                ),
                SizedBox(height: 20),
                //
                // PASSWORD FIELD
                CupertinoTextField(
                  placeholder: "Password",
                  padding: EdgeInsets.all(15),
                  obscureText: true,
                  placeholderStyle: AppStyles.body_text,
                  style: AppStyles.body_text,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  onChanged: (val) => _controller.setPassword(val),
                ),
                SizedBox(height: 20),
                //
                // REPEAT PASSWORD FIELD
                CupertinoTextField(
                  placeholder: "Repeat password",
                  padding: EdgeInsets.all(15),
                  obscureText: true,
                  placeholderStyle: AppStyles.body_text,
                  style: AppStyles.body_text,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  onChanged: (val) => _controller.setConfirmPassword(val),
                ),
                SizedBox(height: 20),
                //
                // LOGIN BUTTON
                CupertinoButton.filled(
                  child: Text("NEXT"),
                  borderRadius: BorderRadius.circular(40),
                  onPressed: () async {
                    
                    var response = await _controller.register();

                    if (response) {
                      Navigator.of(context).pushReplacementNamed("/complete-registration");
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
