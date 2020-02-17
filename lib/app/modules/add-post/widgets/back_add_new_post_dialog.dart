import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/modules/add-post/widgets/guest_tag_item.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/custom_back_button.dart';
import 'package:weddy/app/shared/widgets/search_guest_widget.dart';

/*
  Widget for uploading the new post
  Displays the image preview from the user's phone
  and add tags to the image

  The post will be created in two steps.
  1. Upload the image to Firebase Cloud Storage
  2. After the upload we will get the image URL then add the post entry to Hasura DB

  After that, close the Dialog 

*/

class AddNewPostDialog extends StatelessWidget {
  // Lets receive the image path from the Add Post Controller
  final image;
  const AddNewPostDialog({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPostController = Modular.get<AddPostController>();
    PanelController _pc = new PanelController();
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        return Material(
          child: SlidingUpPanel(
            boxShadow: [
              BoxShadow(blurRadius: 5.0, color: Color.fromRGBO(0, 0, 0, 0.2))
            ],
            controller: _pc,
            backdropEnabled: true,
            // addPostController.tagsContentOpacity is direct proportional at how much the slide is showing
            // sow we use it to show the border radius of the slide or the drops shadow depending if the slide is opened or closed
            renderPanelSheet:
                addPostController.tagsContentOpacity >= 0.2 ? false : true,
            panel: GuestsList(size),
            // Set the slide content opacity depending on the position os the slide
            // If it's opened, set opacity to 1
            // If it's closed set opacity to 0
            // Alse set the live in between value
            onPanelOpened: () => addPostController.setTagsContentOpacity(1.0),
            onPanelClosed: () => addPostController.setTagsContentOpacity(0.0),
            onPanelSlide: (val) => addPostController.setTagsContentOpacity(val),
            body: Scaffold(
              body: Stack(
                children: [
                  // IMAGE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IMAGE PREVIEW
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                          minWidth: size.width,
                          maxHeight: size.height / 1.5,
                        ),
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 10.0),
                        child: Text(
                          "People in this picture",
                          style: AppStyles.h3,
                        ),
                      ),

                      // ADD BUTTON
                      

                      // show the tags as a list view, need to find anoter solution to loop the usermodels
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: addPostController.tags.length,
                          itemBuilder: (_, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 10.0),
                              child: Text(
                                  "${addPostController.tags[index].name} ${addPostController.tags[index].surname},",
                                  style: AppStyles.tags),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  // CUSTOM BACK BUTTOn
                  CustomBackButton(),
                ],
              ),

              /**
                * ACTION BUTTON ADD NEW POST
                * uploads the image and save the record on Hasura
              **/
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppStyles.primaryColor,
                child: Icon(Icons.file_upload),
                onPressed: () {

                    //UPLOAD 
                    addPostController.addPostHasura(image);

                },
              ),

              // Lets add a bottom navigation bar only for designing purpose
              // to put the floating button a bit higher
              bottomNavigationBar: BottomAppBar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 30.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget GuestsList(size) {
  final guestsController = Modular.get<GuestsController>();
  final addPostController = Modular.get<AddPostController>();

  return Observer(
    builder: (_) {
      var filter = guestsController.filter;
      return Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            // SHOW/HIDE TAGS
            Container(
              width: double.infinity,
              height: 40,
              child: Stack(
                children: [
                  // SHOW TAGS
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Text("Add tags",
                        style: TextStyle(
                            // lerp function will animate the text size from 14 to 20
                            // based on the tagsContentOpacity value that rages from 0 to 1
                            fontSize: lerpDouble(
                                14, 20, addPostController.tagsContentOpacity))),
                  ),

                  Positioned(
                    left: size.width / 2 - 20,
                    top: 0,
                    // addPostController.tagsContentOpacity is direct proportional at how much the slide is showing
                    // se we use it here to change the arrow icon to UP or DOWN based on the slide open/close position
                    child: addPostController.tagsContentOpacity >= 0.5
                        ? Icon(Icons.keyboard_arrow_down, color: Colors.black54)
                        : Icon(Icons.keyboard_arrow_up, color: Colors.black54),
                  )

                  // HIDE TAGS
                ],
              ),
            ),

            // SEARCH GUEST WIDGET
            AnimatedOpacity(
              opacity: addPostController.tagsContentOpacity,
              duration: Duration(milliseconds: 200),
              child: SearchGuestWidget(guestsController: guestsController),
            ),

            Expanded(
              child: AnimatedOpacity(
                opacity: addPostController.tagsContentOpacity,
                duration: Duration(milliseconds: 200),
                child: ListView.builder(
                  itemCount: guestsController.allGuests.length,
                  itemBuilder: (BuildContext context, int index) {
                    // FILTERED GUESTS LIST
                    // 1. Check if we have a filter string
                    return (filter == null || filter == "")
                        // If we dont have it, display all guests
                        ? GuestTagItem(guestsController, index)
                        // 2. If we have it
                        // send the item to the controller and perform the filtering by guest name
                        : guestsController.filterByIndex(index)
                            ? GuestTagItem(guestsController, index)
                            : new Container();
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
