import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/home/widgets/no_posts_yet.dart';
import 'package:weddy/app/modules/home/widgets/post_grid_item.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

import '../home_controller.dart';

class PostsGrid extends StatelessWidget {
  // Connects with the Home Controller ( Mobx observables and Actions)
  final homeController = Modular.get<HomeController>();

  // Creates a controller for our grid,
  // so we can track the amount scrolled
  // and trigger animations based on the scroll (eg: Guests component fadeout)
  final ScrollController _grid_controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // Listens to the Grid Scroll Controller
    // every time we scroll the grid, call our Action that
    // will update the gridScrollController Observable on the home_controller.dart
    // updateGridScrollController is the Action that does the job
    _grid_controller.addListener(() {
      var offset = _grid_controller.hasClients ? _grid_controller.offset : 0;
      homeController.updateGridScrollController(offset);
    });

    // Use Expanded so the grid will fill the remaining space on the page
    return Expanded(
      // Add some padding around the grid
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /**
             *  DISCOVER **/
            Padding(
              padding: const EdgeInsets.only(top:10.0, left: 10.0),
              child: Text("Discover", style: AppStyles.h1_bold),
            ),
            
            SizedBox(height: 20),

            /** 
             * GRID VIEW WITH POSTS **/
            Expanded(
              // Lets Observer the homeController.posts so we update the grid
              // based on the items in the posts list
              child: StreamBuilder(
                stream: homeController.posts,
                builder: (BuildContext context, snapshot) {
                  /** 
                   * SHOW LOADING WHILE FETCHING DATA */
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppStyles.primaryColorAlpha,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppStyles.primaryColor),
                      ),
                    );
                  }

                  /** 
                   * IF THERE IS NO POSTS YET, SHOW MESSAGE TO THE USER */
                  if (snapshot.data.length <= 0) {
                   return  NoPostsYet();
                  }

                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: false,
                    controller: _grid_controller,
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      /** 
                        * POST ITEMS **/
                      return PostItem(
                        postItem: snapshot.data[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
