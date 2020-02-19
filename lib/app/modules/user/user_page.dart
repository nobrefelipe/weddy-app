import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/user/widgets/avatar.dart';
import 'package:weddy/app/modules/user/widgets/avatar_placeholder.dart';
import 'package:weddy/app/modules/user/widgets/user_posts.dart';
import 'package:weddy/app/modules/user/widgets/user_posts_placeholder.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/loading_indicator.dart';

import 'user_controller.dart';

class UserPage extends StatefulWidget {
  final String id;
  const UserPage({Key key, this.id}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _userController = Modular.get<UserController>();

  // Post
  Future user;

  // Get the post by the id
  @override
  void initState() {
    user = _userController.getUser(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 45, left: 2),
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Modular.to.pop(),
                  color: AppStyles.primaryColor,
                ),
                Observer(
                  builder: (_) {
                    
                    var _user = _userController.user;

                    /*
                      While fetching the user
                      let's show a placeholder
                    */
                    if (_user == null) return UserAvatarPlaceholder();
                    /*
                      Then show the user avatar
                      UserAvatar receives the user as parameter so we can display the user's details
                    */
                    return UserAvatar(user: _user);

                  },
                )
              ],
            ),
          ),
          Expanded(child: Observer(
            builder: (_) {
              var _user = _userController.user;

              if (_user == null) return UserPostsPlaceholder();

              var _userPosts = _user.posts;

              return UserPosts(userPosts: _userPosts);
            },
          )),
        ],
      ),
    );
  }
}

