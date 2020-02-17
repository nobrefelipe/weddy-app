import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/widgets/add_new_post_button.dart';

import 'package:weddy/app/modules/home/widgets/bottom_navigation_bar.dart';
import 'package:weddy/app/modules/home/widgets/guest_scrollable_list.dart';
import 'package:weddy/app/modules/home/widgets/posts_grid.dart';
import 'package:weddy/app/shared/widgets/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      /** APPBAR **/
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: WeddayLogo(),
        actions: [
          // 
          // LOGOUT
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () async {
              // Log out
              await FirebaseAuth.instance.signOut();
   
              // navigate to login
              Modular.to.pushReplacementNamed("/auth/login");
            },
          ),
        ],
      ),
      /** BODY **/
      body: Column(
        children: [
          /** GUEST SCROLLABLE LIST **/
          //GuestScrollableList(),

          /** POSTS GRID **/
          PostsGrid(),
        ],
      ),

      /** BOTTOM NAVIGATION **/
      bottomNavigationBar: CustomBottomNavigationBar(),

      /** ACTION BUTTON ADD NEW POST **/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddNewPostButton(),
    );
  }

  
  
}
