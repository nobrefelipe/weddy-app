import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/modules/home/home_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

/*
  TODO: improve this widget

  GUEST LIST
  this is the widget responsable for the guest list on top of the home view.
  It displays a horizontal scrollable list
  with a guest picture on top and name on the bottom/

  It is animated to disapear when the user scrolls the page up
  it will fade out and scale down based on how far the user scrolls
*/
class GuestScrollableList extends StatelessWidget {
  /*
    Instance of GuestsController
    so we can fetch the guests
  */
  final _guestsController = Modular.get<GuestsController>();

  /*
    Instanciate HomeController
  */
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    /*
      Returning  Observer
      that will observe changes on HomeController's gridScrollController observable
    */
    return Observer(
      builder: (_) {
        /*
          This is what make the widget animate
          1. offset : is the amount the user scrolled the page. 
                      gridScrollController is an observable that will get updated everytime the user scrolls
                      its value is updated from the PostGrid widget
          2. factor : is a value between 0 and 1
                      this this the responsable for how the elements will animate
                      the bigger the number, the quicker the animation will play
          3. amount : are the contrains that we want the animation to be placed between
                      in this case we want to keep the amount between 0 and 1.
                      But we can change if we would like to make the itens scale up to create a elastic effect
        */
        var offset = _homeController.gridScrollController;
        var factor = 1 - offset / 300;
        var amount = (factor <= 0) ? 0.0 : (factor >= 1) ? 1.0 : factor;

        /*
          Returning a AnimatedContainer
          that will animate its height based on the variables set above
        */
        return AnimatedContainer(
          duration: Duration(microseconds: 1000),
          /*
            Animates the height of the widget to reduce ultil disapear 
            this way when the user scrolls, the Discover section will take its place on top
          */
          height: 125 * amount,
          child: Opacity(
            opacity: amount,
            /*  
              Defining a Column containing TWO Expanded Widgets
              1. Expanded : contains the top part 
              2. Expanded: : contains the list view         

              Use Expanded here because we animate the size of the widgets within it
              this avoids overflow issues when scaling down the wigets 
            */
            child: Column(
              children: [
                /*
                  The Container will have a Row defining TWO widgets wrapped with some Padding:
                  1. Text : contains the title of the widget "Guests"
                  2. GestureDetector : contains a button that leads to the guests page   
                */
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Guests",
                            style: TextStyle(
                                fontSize: 18 * amount,
                                fontFamily: 'firasans',
                                fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () => Modular.to.pushNamed('/guests'),
                            child: Text(
                              "see all",
                              style: TextStyle(
                                fontSize: 14 * amount,
                                fontFamily: 'firasans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*
                  GUEST LIST VIEW
                  Difining a Expanded containing a StreamBuilder
                  this widget will expand to fit the remaining space on the viewport
        
                */
                Expanded(
                  flex: 2,
                  /*
                    Use stream builder because allGuets will return a stream
                    from hasura subscription
                    this will listem to the guests database and
                    display them here as soon as they get created
                  */
                  child: StreamBuilder(
                    stream: _guestsController.allGuests,
                    builder: (BuildContext context, snapshot) {
                      /*
                        Show loading while fetching data
                      */
                      if (!snapshot.hasData) return Container();

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext ctxt, int index) {
                          var guest = snapshot.data[index];

                          return Transform.scale(
                            scale: amount,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SingleChildScrollView(
                                child: GestureDetector(
                                  onTap: () => Modular.to
                                      .pushNamed("/user/${guest.userUid}"),
                                  child: Column(
                                    children: [
                                      /*
                                        Guest profile image
                                      */
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            child: (guest.picture != "")
                                                ? Image.network(
                                                    "${guest.picture}")
                                                : Image.asset(
                                                    "assets/img/avatar.png")),
                                      ),
                                      /*
                                        Guest name
                                      */
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "${snapshot.data[index].name} ${snapshot.data[index].surname}",
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyles.body_text_small,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
      },
    );
  }
}
