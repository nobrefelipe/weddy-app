import 'package:flutter/material.dart';

class PostBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 9.0,
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
        ),
      ),
    );
  }
}
