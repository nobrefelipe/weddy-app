import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class AppWidget extends StatelessWidget {
  // Allow only Portrait Mode

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Weddy App',
      initialRoute: '/auth/verifier',
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
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
