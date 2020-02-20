import 'package:flutter/material.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:weddy/app/shared/widgets/image_loader.dart';

/* 
  POST AUTHOR WIDGET
  this is the widget responsable for displaying the PICTURE and NAME for the user
  
  It is used on:
  
  1. Home Page Grid. Above the image
  2. Guests Page, as a clicable item in the List View

  @param size, the size of the widget (small, medium and big)
  @param userData, whis a a UserModel object that will provide user information for the widget to render
  
*/
class PostAuthor extends StatelessWidget {
  final String size;
  final UserModel userData;

  PostAuthor({
    this.size = 'medium',
    @required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /*
        Defining a ROW containing 3 widgets:
        1. Container : this is where the user picture will be rendered
        2. SizedBox : to add horizontal spacing between picture and name 
        3. Text : this is where the user name and surname will be rendered
      */
      child: Row(
        children: [
          /*
            User picture
          */
          Container(
            /*
              change size of the picture based on the SIZE parameter 
            */
            width: size == 'medium' ? 40 : 30,
            height: size == 'medium' ? 40 : 30,

            /*
              Make the image rounded
            */
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              /*
                Add a container so we can have a background color
                for the image default avatar
              */
              child: Container(
                color: Colors.black12,
                /*
                  Check it the user's got a picture
                */
                child: (userData.picture != "")
                    /*
                      Is so, let's load the picture
                    */
                    ? ImageLoader(image: userData.picture)
                    /*
                      Otherwise, let's put the placeholder in
                    */
                    : Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.asset("assets/img/avatar.png"),
                      ),
              ),
            ),
          ),
          /*
            User name and surname
          */
          SizedBox(width: 5),
          Text(
            "${userData.name} ${userData.surname}",
            /*
              Set the text size based on the SIZE parameter
            */
            style: size == 'medium'
                ? AppStyles.body_text
                : AppStyles.body_text_small,
          ),
        ],
      ),
    );
  }
}
