import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 9.0,
      elevation: 20,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 0),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            onPressed: () => Modular.to.pushReplacementNamed("/"),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            onPressed: () => Modular.to.pushNamed("/guests"),
          ),
          SizedBox(width: 50),
          IconButton(
            icon: Icon(
              Icons.local_offer,
              size: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            onPressed: () => Modular.to.pushNamed("user"),
          ),
          SizedBox(width: 0),
        ],
      ),
    );
  }
}
