import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class TagWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      color: Colors.transparent,
      highlightElevation: 0,
      padding: EdgeInsets.only(top: 0, right: 10, bottom: 10),
      child: Text(
        "@Natalia Sclipet",
        style: AppStyles.tags,
      ),
      onPressed: () => Modular.to.pushNamed("user"),
    );
  }
}
