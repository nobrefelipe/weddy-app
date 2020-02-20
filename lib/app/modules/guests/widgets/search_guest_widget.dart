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
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        labelText: "Search",
        labelStyle: AppStyles.tags,
        prefixIcon: Icon(
          Icons.search,
          color: AppStyles.primaryColorAlpha,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppStyles.primaryColorAlpha),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusColor: AppStyles.primaryColorAlpha,
      ),
      onChanged: (value) {
        guestsController.filterGuestByName(value);
      },
    ),
  );
  }
}