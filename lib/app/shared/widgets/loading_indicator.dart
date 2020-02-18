import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppStyles.primaryColorAlpha,
        valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
      ),
    );
  }
}
