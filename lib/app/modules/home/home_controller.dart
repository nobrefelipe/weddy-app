
import 'package:mobx/mobx.dart';
import 'package:weddy/app/app_module.dart';
import 'package:weddy/app/modules/auth/auth_module.dart';
import 'package:weddy/app/modules/auth/pages/verifier/verifier_controller.dart';
import 'package:weddy/app/modules/home/repositories/home_repository.dart';
import 'package:weddy/app/shared/models/post_model.dart';


part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  final HomeRepository _homeRepository;
  _HomeBase(this._homeRepository){

    // Call gerPosts() 
    // in the cosntructor so we get the posts when HomeController is instanciated
    getPosts();
  }

  // Get the instance of Verifier Controller
  // So we can use it on getPosts to get the id of the wedding we want to show the posts of
  var _verifierController = AuthModule.to.get<VerifierController>();
  

  // Grid Scroll Controller that tracks the scolled amount
  // when we scroll the grid on the home page.
  // We use this on the animation of the Guests component on the home page
  @observable
  var gridScrollController = 1.0;

  // Update the gridScrollController value.
  // Will be called everytime the user scrolls the grid view
  @action
  void updateGridScrollController(value) {
    gridScrollController = value;
  }

  // List of Posts
  @observable
  Stream<List<PostModel>> posts;

  // Get posts and asign to the list posts
  // weddingUID will make us get only the posts related to the wedding with the given uid
  @action
  void getPosts() {

    // Wedding id will come from the Verifier Controller
    // that's the place we get the wedding id based on the wedding code
    var weddingUID = _verifierController.weddingID;

    posts = _homeRepository.getPosts(weddingUID);


  }



}
