import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/auth/auth_module.dart';
import 'package:weddy/app/modules/auth/pages/verifier/verifier_controller.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/logo.dart';

class VerifierPage extends StatefulWidget {
  final String title;
  const VerifierPage({Key key, this.title = "Verifier"}) : super(key: key);

  @override
  _VerifierPageState createState() => _VerifierPageState();
}

class _VerifierPageState extends State<VerifierPage> {
  var _controller = AuthModule.to.get<VerifierController>();

  bool loading = false;

  bool isLoggedIn = false;

  

  // CHECK IF USER IS LOGGED IN
  // check if we have a token
  checkLogin() async {
    isLoggedIn = await _controller.checkLogin();

    if (!isLoggedIn) {
      // navigate to login
      // Modular.to.pushReplacementNamed("/auth/login");
      Modular.to.pushReplacementNamed("/onboarding");
    }

    setState(() => isLoggedIn = true);

  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _appBarHeight = 115;

    /*
      Check if the user is logged in to show the passcode input
      if the user is not logged in the app will redirect to the OnBoarding screen
      we dont want to show the user the passcode input in that case, se we display a empty Container
    */
    return !isLoggedIn
        ? Container(
            color: Colors.white,
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: WeddayLogo(),
              actions: [
                //
                // LOGOUT
                IconButton(
                  icon: Icon(Icons.power_settings_new),
                  onPressed: () async {
                    // Log out
                    await FirebaseAuth.instance.signOut();

                    // navigate to login
                    Modular.to.pushReplacementNamed("/onboarding");
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                width: _screenSize.width,
                height: _screenSize.height - _appBarHeight,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Enter the wedding code",
                        style: AppStyles.h2_primary,
                      ),
                      SizedBox(height: 10),
                      Observer(
                        builder: (_) {
                          return Text(
                            "${_controller.errorMessage}",
                            style: AppStyles.error_text,
                          );
                        },
                      ),
                      //
                      // WEDDING CODE INPUT
                      PinEntryTextField(
                        fields: 6,
                        onSubmit: (String pin) async {
                          // Show loading
                          setState(() => loading = true);

                          await _controller.getWeddingByCode(pin);

                          // Hide loading
                          setState(() => loading = false);
                        },
                      ),
                      SizedBox(height: 60),
                      loading ? CircularProgressIndicator() : Container(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
