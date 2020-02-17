 /*
   * LINEAR PROGRESS INDICATOR 
   */
import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class CustomLinearProgressIndicator extends StatelessWidget {

  final progressPercent;
  const CustomLinearProgressIndicator({Key key, this.progressPercent}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 10,
        child: LinearProgressIndicator(
          backgroundColor: AppStyles.primaryColorAlpha,
          valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
          value: progressPercent,
        ),
      ),
    );
  }
}