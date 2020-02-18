import 'package:mobx/mobx.dart';
import 'package:weddy/app/modules/guests/repository/guests_repository.dart';
import 'package:weddy/app/shared/models/user_model.dart';

part 'guests_controller.g.dart';

class GuestsController = _GuestsBase with _$GuestsController;

abstract class _GuestsBase with Store {
  final GuestsRepository _guestsRepository;

  _GuestsBase(this._guestsRepository) {
    // Call gerAllGuests()
    // in the cosntructor so we get the guests when GuestsController is instanciated
    _getAllGuests();
  }

  // ALL GUEST OBSERVABLE
  @observable
  Stream<List<UserModel>> allGuests;

  // GET ALL GUESTS
  _getAllGuests() {
    allGuests = _guestsRepository.getGuests();
  }

  // FILTERING
  // Filter string will come from the search input
  @observable
  String filter = "";


  // Set the filter value
  // we call this action from the onChange event of the search box
  @action
  void filterGuestByName(value) => filter = value;

  // Filter the guests
  // receive the guest item from the list and check if the item contains
  // the filter value in the NAME attribute
  @action
  bool filterByIndex(guest) {
  

    return guest
        .name // we want to apply the filter to the NAME attribute
        .toLowerCase() // make sure it's all lower case
        .contains(// Check if the NAME CONTAINS the FILTER value
          filter.toLowerCase(), // make sure the filter value is lowercase
        );
  }

  
}
