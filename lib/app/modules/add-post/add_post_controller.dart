
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:weddy/app/modules/add-post/widgets/add_new_post_dialog.dart';
import 'package:weddy/app/modules/auth/auth_module.dart';
import 'package:weddy/app/modules/auth/pages/verifier/verifier_controller.dart';
import 'package:weddy/app/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_post_controller.g.dart';

class AddPostController = _AddPostBase with _$AddPostController;

abstract class _AddPostBase with Store {

  final  _addPostRepository;

  _AddPostBase(this._addPostRepository);

  /*
    ON CLICK GET IMAGE
    action that we call from the floating action button on the home page
    used the ImagePicker plugin so we can get an image from  the user's gallery
    When the users select's an image we open the full screen dialog 
    passing the image path to it so the upload can be done.
  */
  @action
  Future<void> onClickGetPicture(context) async {
  
    final image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return false;

    // Show the full screen dialog
    _addNewPostDialog(context, image);
    // Modular.to.pushNamed("/addNew");
  }

  /*
    ADD NEW POST DIALOG
    will open a full screen dialog
    @param image => the image we will need to upload
    We will set the tags there
  */
  void _addNewPostDialog(context, image) {
    Navigator.of(context).push(
      new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return AddNewPostDialog(image: image);
        },
        fullscreenDialog: true,
      ),
    );
  }


  @observable
  double tagsContentOpacity = 0.0;

  @action
  void setTagsContentOpacity(value) {
    tagsContentOpacity = value;
  }

  /*
    LIST OF SELECTED TAGS
  */
  @observable
  List<UserModel> tags = [];
  @action
  void addGuestToTags(guest) {
    if (tags.contains(guest)) {
      tags.remove(guest);
    } else {
      tags.add(guest);
    }
  
  }


  // Get the instance of Verifier Controller
  // So we can use it on addPostHasura to add the post to the current wedding
  final  _verifierController = AuthModule.to.get<VerifierController>();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // ADD THE POST TO HASURA
  // weddingOwnerID will be the wedding the post is related with
  @action
  Future<bool> addPostHasura(imagePath) async{

    // Wedding id will come from the Verifier Controller
    // that's the place we get the wedding id based on the wedding code
    var weddingUID = _verifierController.weddingID;

    // Get the author id from the FirebaseAuth instance of current user
    var authorID = (await _auth.currentUser()).uid;

    // Somehow firebase uses %2F instead of /
    // so lets repalce it before adding to db
    var finalImagePath = "https://firebasestorage.googleapis.com/v0/b/weddy-app-1.appspot.com/o/$imagePath?alt=media".replaceAll("o/images/", "o/images%2F");
    var thumbNailUrl = finalImagePath.replaceAll(".png", "_400x300.png");
    return await _addPostRepository.addPost(weddingUID, finalImagePath, authorID, thumbNailUrl);

  }

}
