import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/modules/add-post/widgets/uploder.dart';
import 'package:weddy/app/shared/widgets/custom_back_button.dart';
import 'package:weddy/app/shared/widgets/image_preview.dart';

/*
  Widget for uploading the new post
  Displays the image preview from the user's phone
  => todo: and add tags to the image

  The post will be created in two steps.
  1. Upload the image to Firebase Cloud Storage
  2. After the upload we will get the image URL then add the post entry to Hasura DB

  After that, close the Dialog 

*/

class AddNewPostDialog extends StatelessWidget {
  // Lets receive the image path from the Add Post Controller
  final image;
  const AddNewPostDialog({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size of viewport used to get the width and height
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // CUSTOM BACK BUTTON
          CustomBackButton(),

          Positioned(
            top: 150,
            left: (size.width / 2) - ((size.width - 100) / 2),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                maxWidth: size.width - 100,
              ),
              child: Column(
                children: [
                  /*
                   * IMAGE PREVIEW
                   */
                  // if the image is there
                  (image != null)
                      // show the preview image
                      ? ImagePreview(
                          imageURL: image,
                          isFromDevice: true,
                        )
                      :
                      // otherwise, show the loading box
                      Container(
                          width: size.width - 100,
                          height: 300,
                          color: Colors.black12,
                          child: Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                  SizedBox(height: 40),
                  /*
                   *  UPLOAD BUTTON
                   */
                  // if the image is there
                  Center(
                    child: (image != null)
                        // show the uploader button
                        ? Uploader(image: image)
                        :
                        // otherwise, show nothing
                        Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
