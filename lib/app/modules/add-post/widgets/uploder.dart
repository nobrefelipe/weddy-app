import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:uuid/uuid.dart';
import 'package:weddy/app/shared/widgets/is_complete_feedback.dart';
import 'package:weddy/app/shared/widgets/linear_progress_indicator.dart';

/*
  UPLOADER WIDGET
  This widget is reponsible for uploading the image to Fire Storage
  First we upload the image to  Fire Store
  then we sabe the image URL to Hasura via _addPostController.addPostHasura(filepath);
*/

// USED FOR GENERATING UNIQUE ID FOR THE IMAGE
var uuid = Uuid();

class Uploader extends StatefulWidget {

  // Receive the image path from the parent widget
  // this will be the image path that we get from the Image Picker plugin
  final image;
  const Uploader({Key key, this.image}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {

  // Add Post Controller
  final _addPostController = Modular.get<AddPostController>();

  // Storage Bucket URL
  static final bucketURL = "gs://weddy-app-1.appspot.com";

  // Create the file path variable
  String filepath;

  // Upload task will be responsible for uploading the iamge
  // and returning a stream that we will be using to get the status of the upload
  StorageUploadTask _uploadTask;

  // Get the Storage Bucket reference 
  final FirebaseStorage _storage = FirebaseStorage(storageBucket: bucketURL);

  // STARTS THE UPLOAD
  void _startUpload() {
    filepath = "images/${uuid.v1()}.png";

    // Start the upload and set it to _uploadTask
    setState(() {
      _uploadTask = _storage.ref().child(filepath).putFile(widget.image);
    });
  }

  @override
  Widget build(BuildContext context) {

    // CHECK IF UPLOAD TASK = NULL
    // IF IT'S NOT NULL, MEANS WE ARE UPLOADING
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (_, snapshot) {

          var event = snapshot?.data?.snapshot;

          // Uploading progress
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;

          // ONCE THE UPLOAD IS COMPLETE
          // LETS SAVE THE POST TO HASURA
          if (_uploadTask.isComplete)
            _addPostController.addPostHasura(filepath);

          return Column(
            children: [
              // IS IN PROGRESS
              // SHOW THE LOADING BAR
              if (_uploadTask.isInProgress)
                CustomLinearProgressIndicator(progressPercent: progressPercent),

              // IS COMPLETE
              // SHOW FEEDBACK AFTER UPLOAD IS COMPLETE
              if (_uploadTask.isComplete)
                IsCompleteFeedback(message: "Thank you for sharing your picture!"),
            ],
          );
        },
      );
    } 
    // IF UPLOAD TASK IS NULL
    // SHOW THE UPLOAD BUTTON
    else {
      return uploadButton();
    }
  }

  /*
   * UPLOAD BUTTON AND CHANGE PICTURE BUTTON
   */
  uploadButton() {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            // BUTTON
            RaisedButton(
              color: AppStyles.primaryColor,
              elevation: 10,
              padding:
                  EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "UPLOAD",
                    style: AppStyles.h4_white,
                  ),
                ],
              ),
              onPressed: _startUpload,
            ),
            SizedBox(
              height: 20,
            ),

            // CHANGE IMAGE
            GestureDetector(
              child: Text(
                "Change image",
                style: AppStyles.body_text,
              ),
              onTap: () {
                _addPostController.onClickGetPicture(context);
              },
            ),
          ],
        );
      },
    );
  }
}
