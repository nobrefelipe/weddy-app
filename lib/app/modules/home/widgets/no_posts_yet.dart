import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class NoPostsYet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/img/be-the-first.png",
                width: MediaQuery.of(context).size.width - 50,
              ),
            ),
          ),
          Positioned(
            left: 50,
            bottom: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Text("Be the first one to share", style: AppStyles.h2_bold),
                Text("No one has shared a picture yet. ",
                    style: AppStyles.body_text),
                Text("Tap on the button bellow and start sharing!",
                    style: AppStyles.body_text),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
