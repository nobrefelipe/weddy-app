/*
  LINEAR PROGRESS INDICATOR 
  renders a linear progress indicator to give users feedback when uploading or downloadin pictures

  @param progressPercent, is the current percentage value 
*/
import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class CustomLinearProgressIndicator extends StatelessWidget {

  final progressPercent;
  const CustomLinearProgressIndicator({Key key, this.progressPercent}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    /*
      Use ClipRRect to make it rounded on the borders (it is squared by default)
    */
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 10,
        child: LinearProgressIndicator(
          value: progressPercent,
          backgroundColor: AppStyles.primaryColorAlpha,
          valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
        ),
      ),
    );
  }
}