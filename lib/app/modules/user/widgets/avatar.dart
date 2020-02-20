import 'package:flutter/material.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/image_loader.dart';

/*
  USER AVATAR
  This widget is responsable for displaying the user picture and name
  It receives a UserModel object from it's parent

  @param user, UserModel object containing the user details
*/

class UserAvatar extends StatelessWidget {
  
  final UserModel user;
  const UserAvatar({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          /*
            Add a border to the image
          */
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppStyles.primaryColor, 
              width: 2.0,
            ),
          ),
          /*
            Makes the image rounded
          */
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            /*
              Load and display the image
            */
            child: ImageLoader(image: user.picture),
          ),
        ),
        SizedBox(height: 10),
        /*
          Display name and surname
        */
        Text(
          "${user.name} ${user.surname}",
          style: AppStyles.body_text,
        ),
      ],
    );
  }
}
