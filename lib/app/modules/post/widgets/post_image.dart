import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage("assets/img/wedding-image.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
