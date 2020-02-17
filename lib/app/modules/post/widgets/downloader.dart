import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:weddy/app/modules/add-post/add_post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:uuid/uuid.dart';
import 'package:weddy/app/shared/widgets/custom_dialog.dart';
import 'package:weddy/app/shared/widgets/is_complete_feedback.dart';
import 'package:weddy/app/shared/widgets/linear_progress_indicator.dart';


class Downloader extends StatefulWidget {

  // Receive the image path from the parent widget
  // this will be the image path that we get from the Image Picker plugin
  final imageURL;
  const Downloader({Key key, this.imageURL}) : super(key: key);

  @override
  _DownloaderState createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {


double _progress = 0.0;

  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress.toDouble();
      });
    });
  }

  Future<void> _downloadImage() async {
    
    await ImageDownloader.downloadImage(widget.imageURL);

  }
  
  @override
  Widget build(BuildContext context) {

    if(_progress == 0) 
      return uploadButton();

    if(_progress == 100) 
      return IsCompleteFeedback(message: "All done! You can find the picture \n in your device's gallery"); 
    
    if(_progress < 100 && _progress > 0) 
      return CustomLinearProgressIndicator(progressPercent: _progress);
    
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
                    Icons.file_download,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "DOWNLOAD",
                    style: AppStyles.h4_white,
                  ),
                ],
              ),
              onPressed: _downloadImage,
            ),
            SizedBox(
              height: 20,
            ),

           
          ],
        );
      },
    );
  }
}
