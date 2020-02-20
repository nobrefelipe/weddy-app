import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/loading_indicator.dart';
import 'package:weddy/app/shared/widgets/post_author.dart';
import './widgets/search_guest_widget.dart';

class GuestsPage extends StatelessWidget {
  final _guestsController = Modular.get<GuestsController>();

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
          //
          // SEARCH GUEST WIDGET
          //
          SearchGuestWidget(guestsController: _guestsController),

          Expanded(
            //
            // Use stream builder because allGuets will return a stream
            // from hasura subscription
            // this will listem to the guests database and
            // display them here as soon as they get created
            //
            child: StreamBuilder(
              stream: _guestsController.allGuests,
              builder: (BuildContext context, snapshot) {
                //
                // Show loading while fetching data
                //
                if (!snapshot.hasData) {
                  return LoadingIndicator();
                }

                return Observer(
                  builder: (_) {
                    //
                    // Lets observer for changes in the filter strig
                    //
                    var filter = _guestsController.filter;

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        //
                        // FILTERED GUESTS LIST
                        // 1. Check if we have a filter string
                        //
                        return (filter == null || filter == "")
                            //
                            // If we dont have it, display all guests
                            //
                            ? guestList(snapshot.data[index])
                            //
                            // 2. If we have it
                            // send the item to the controller 
                            // and perform the filtering by guest name
                            // filterByIndex(guest) will filter the guest by its name attribute
                            // if the filter return true, display the gest
                            // otherwise display an empty container
                            //
                            : _guestsController.filterByIndex(snapshot.data[index])
                                ? guestList(snapshot.data[index])
                                : new Container();
                      },
                    );
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
Container guestList(guest) {
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
        userData: guest,
      ),
    ),
  );
}
