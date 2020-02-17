import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class AddNewPostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _addPostController = Modular.get<AddPostController>();

    return FloatingActionButton(
      backgroundColor: AppStyles.primaryColor,
      elevation: 10,
      child: Icon(Icons.camera_alt),
      onPressed: () => _addPostController.onClickGetPicture(context),
    );
  }
}
