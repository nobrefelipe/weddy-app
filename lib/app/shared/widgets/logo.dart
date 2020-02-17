import 'package:flutter/material.dart';

class WeddayLogo extends StatelessWidget {
  const WeddayLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Image.asset(
        "assets/img/wedday-logo.png",
      ),
    );
  }
}
