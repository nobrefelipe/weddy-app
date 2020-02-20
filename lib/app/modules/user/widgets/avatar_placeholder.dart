import 'package:flutter/material.dart';

/*
  Placeholder for the avatar widget
  show it when the user is being loaded
  Contains the cshape of the avatar widget
  Circle on the top, faking the user picture
  Squared on the bottom, faking the name surname 
*/
class UserAvatarPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.black12,
                )),
          ),
          SizedBox(height: 10),
          Container(
            width: 100,
            height: 20,
            color: Colors.black12,
          )
        ],
    );
  }
}
