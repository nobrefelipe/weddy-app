
import 'package:flutter/material.dart';

class UserPostsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: false,
      itemCount: 15,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        //** POST ITEMS **/
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
