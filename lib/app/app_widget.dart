import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class AppWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    /*
      Allow only Portrait Mode
    */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Weddy App',
      /*
        Auth Verifier will be always the first route the app requests. 
        It is responsable for verifing if the user is logged in 
        and asking the user to provide the wedding  passcode
      */
      initialRoute: '/auth/verifier', 
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
      /*
        set the theme colors
      */
      theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          accentColor: AppStyles.primaryColor,
          cursorColor: AppStyles.primaryColor,
          primaryIconTheme: IconThemeData(color: AppStyles.primaryColor),
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: AppStyles.primaryColor,
          )),
    );
  }
}
