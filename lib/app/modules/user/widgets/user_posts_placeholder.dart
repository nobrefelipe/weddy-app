
import 'package:flutter/material.dart';
/*
  Placeholder for the user posts widget
  show it when the posts are being loaded
  
  Contains a grid view with some items
  the items have a light grey background color
  so we show something on the screen when while the posts are being loaded
*/
class UserPostsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: false,
      itemCount: 15,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        /*
          Fake post items
        */
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black54,
                width: 0.2,
              ),
            ),
            child: Container(
              color: Colors.black12,
            )
        );
      },
    );
  }
}
