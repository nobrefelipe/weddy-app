import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddy/app/modules/guests/guests_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

/*
  SEARCH GUESTS WIDGET
  Widget for filtering the guests
  We use it on the Guests page and Add New Post page

  When the user types we  pass the value to GUest Controller
  so it can handle the filtering
   => guestsController.filterGuestByName(value);
*/
class SearchGuestWidget extends StatelessWidget {
  final GuestsController guestsController;

  const SearchGuestWidget({Key key, this.guestsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: CupertinoTextField(
        placeholder: "Search",
        padding: EdgeInsets.all(15),
        placeholderStyle: AppStyles.body_text,
        style: AppStyles.body_text,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.07),
          borderRadius: BorderRadius.circular(50),
        ),
        onChanged: (value) => guestsController.filterGuestByName(value),
      ),
    );
  }
}
