import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class UserAvatar extends StatelessWidget {
  final UserModel user;
  const UserAvatar({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 50,
      top: 30,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: user.picture,
                placeholder: (context, url) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.black12,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "${user.name} ${user.surname}",
            style: AppStyles.body_text,
          ),
        ],
      ),
    );
  }
}
