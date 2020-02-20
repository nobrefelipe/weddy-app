import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/user/widgets/avatar.dart';
import 'package:weddy/app/modules/user/widgets/avatar_placeholder.dart';
import 'package:weddy/app/modules/user/widgets/user_posts.dart';
import 'package:weddy/app/modules/user/widgets/user_posts_placeholder.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/custom_back_button.dart';

import 'user_controller.dart';

/*
  USER PAGE
  The user page receives a id as parameter and fetched the user by the id
  the route to this page is "/user/:id"
  
  On the UserModule we set the route:
  Router('/:id', child: (_, args) => UserPage(id: args.params['id'])),

  @param id, user id
*/

class UserPage extends StatefulWidget {
  final String id;
  const UserPage({Key key, this.id}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _userController = Modular.get<UserController>();

  /*
    User
  */
  Future user;

  /*
    Get the user by the id
    do it in the initState so we force it to refresh averytime the user access this page
  */
  @override
  void initState() {
    user = _userController.getUser(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
      Size of viewport used to get the width and height
    */
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.appBgColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Stack(
              children: [
                // CUSTOM BACK BUTTOn
                Positioned(
                  top: 60,
                  left: 10,
                  child: CustomBackButton(),
                ),
                Positioned(
                  top: 140,
                  left: size.width / 2 - 50,
                  child: Observer(
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
                  ),
                ),
              ],
            ),
          ),

          /*
            User posts
          */
          Expanded(
            child: Observer(
              builder: (_) {
                
                var _user = _userController.user;

                 /*
                  While fetching the user posts
                  let's show a placeholder
                */
                if (_user == null) return UserPostsPlaceholder();

                /*
                  Then show the user posts
                  UserPosts receives the posts as parameter so we can display them in a grid view
                */
                var _userPosts = _user.posts;

                return UserPosts(userPosts: _userPosts);
                
              },
            ),
          ),
        ],
      ),
    );
  }
}
