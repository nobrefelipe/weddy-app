import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

/*
  CUSTOM BACK BUTTON
  Custom styles back button
  Has a Neumorphism style  
*/
class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
      Wrap the button in a GestureDetector
      to make it clicable
    */
    return GestureDetector(
      /*
        On Tap pop the screen
      */
      onTap: () => Modular.to.pop(),
      child: Padding(
        /*
          Wrap it with some padding
        */
        padding: EdgeInsets.all(10),
        /*
          Use a Stack so we can have the realism effect under the  button content (icon text)
          We archive the effect by giving the container a border radius and some box shadow
          the box shadow on top will be the light 
          the box shadow on bottom will be the shadow 
        */
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: AppStyles.appBgColor,
                borderRadius: BorderRadius.circular(20),
                /*
                  Shadows
                */
                boxShadow: [
                  /*
                    First shadow represents the light on the button
                  */
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-8, -6),
                    blurRadius: 12,
                  ),
                  /*
                    Second shadow represents the shadow itself
                  */
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(8, 6),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),

            /*
              Use Position.fil so the content of the button occupy the entire size of the button
              Here we add the back icon and text
            */
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppStyles.primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Back",
                    style: AppStyles.body_text,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
