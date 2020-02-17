import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/post_author.dart';

/*
  GUEST TAG ITEM
  this is the item we show inside the list of tags on the ADD NEW POST dialog
  It's a statfull widget because we need to change the background color of the 
  item when the users selects it 
*/

class GuestTagItem extends StatefulWidget {
  final guestsController;
  final index;

  const GuestTagItem(this.guestsController, this.index);

  @override
  _GuestTagItemState createState() => _GuestTagItemState();
}

class _GuestTagItemState extends State<GuestTagItem> {
  var addNewPostController;
  var guestItem;
  var color;

  @override
  void initState() {
  
    addNewPostController = Modular.get<AddPostController>();

    guestItem = widget.guestsController.allGuests[widget.index];

    // Check if the guest is already tagged
    // is so, set the background color to show it is selected
    color = addNewPostController.tags.contains(guestItem)
              ? AppStyles.primaryColorAlpha
              : Colors.white;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: Observer(
        builder: (BuildContext context) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: color, // Change the background color if guest is tagged
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            padding: EdgeInsets.all(10.0),
            // GUEST ITEM
            child: PostAuthor(
              userData: guestItem,
            ),
          );
        },
      ),
      onTap: () {
        addNewPostController.addGuestToTags(guestItem);

        setState(() {
          // Check if the guest is already tagged
          // then change the background 
          color = addNewPostController.tags.contains(guestItem)
              ? AppStyles.primaryColorAlpha
              : Colors.white;
        });
      },
    );
  }
}
