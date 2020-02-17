import 'package:flutter/material.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:flutter/foundation.dart';

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
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            width: size == 'medium' ? 40 : 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(userData.picture)),
          ),
          SizedBox(width: 5),
          Text(
            "${userData.name} ${userData.surname}",
            style: size == 'medium'
                ? AppStyles.body_text
                : AppStyles.body_text_small,
          ),
        ],
      ),
    );
  }
}
