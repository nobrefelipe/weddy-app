import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/post_author.dart';
import 'package:weddy/app/shared/widgets/search_guest_widget.dart';

class GuestsPage extends StatelessWidget {
  final guestsController = Modular.get<GuestsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Guests",
          style: AppStyles.h2_primary,
        ),
        iconTheme: IconThemeData(
          color: AppStyles.primaryColor,
        ),
      ),
      body: Column(
        children: [
          // SEARCH GUEST WIDGET
          SearchGuestWidget(guestsController: guestsController),

          Expanded(
            child: Observer(
              builder: (BuildContext context) {
                // Lets observer for changes in the filter strig
                var filter = guestsController.filter;

                return ListView.builder(
                  itemCount: guestsController.allGuests.length,
                  itemBuilder: (BuildContext context, int index) {
                    // FILTERED GUESTS LIST
                    // 1. Check if we have a filter string
                    return (filter == null || filter == "")
                        // If we dont have it, display all guests
                        ? guestList(guestsController, index)
                        // 2. If we have it
                        // send the item to the controller and perform the filtering by guest name
                        : guestsController.filterByIndex(index)
                            ? guestList(guestsController, index)
                            : new Container();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// GUES LIST ITEM WIDGET
Container guestList(guestsController, index) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1.0, color: Colors.black12),
      ),
    ),
    padding: EdgeInsets.all(10.0),
    // Guest List Item
    child: GestureDetector(
      onTap: () => Modular.to.pushNamed("user"),
      child: PostAuthor(
        userData: guestsController.allGuests[index],
      ),
    ),
  );
}
