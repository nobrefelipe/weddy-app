import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/modules/home/home_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'dart:math' as math;

class GuestScrollableList extends StatelessWidget {
  final _guestsController = Modular.get<GuestsController>();

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      var offset = homeController.gridScrollController;
      var factor = 1 - (math.pi * offset) / 400;
      var amount = (factor <= 0) ? 0.0 : (factor >= 1) ? 1.0 : factor;

      return AnimatedContainer(
        duration: Duration(microseconds: 1000),
        height: 110 * amount + 15,
        child: Opacity(
          opacity: amount,
          child: Column(
            children: [
              /**
                   * GUESTS LIST VIEW HEADING
                  **/
              Container(
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
              /**
                   * GUESTS LIST VIEW BODY
                  **/
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _guestsController.allGuests.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctxt, int index) {
                    var guest = _guestsController.allGuests[index];

                    return Transform.scale(
                      scale: amount,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              /**
                                   * Guest profile image
                                  **/
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(25),
                                ) ,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: (guest.picture != "")
                                      ? Image.network("${guest.picture}")
                                      : Image.asset("assets/img/avatar.png")
                                ),
                              ),
                              /**
                                   * Guest name
                                  **/
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "${_guestsController.allGuests[index].name} ${_guestsController.allGuests[index].surname}",
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.body_text_small,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
