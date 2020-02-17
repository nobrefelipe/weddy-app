import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/custom_dialog.dart';

class PostDownloadButton extends StatefulWidget {
  String imageURL;

  PostDownloadButton({this.imageURL});

  @override
  _PostDownloadButtonState createState() => _PostDownloadButtonState();
}

class _PostDownloadButtonState extends State<PostDownloadButton> {
  int _progress = 0;

  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress;
      });
    });
  }

  Future<void> _downloadImage() async {
    await ImageDownloader.downloadImage(widget.imageURL);

    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "Success",
        description: "Thank you! The image was saved in your Photo Library.",
        buttonText: "Okay",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppStyles.primaryColor,
      elevation: 10,
      // If progress is 0 or 100 display the download icon, 
      // otherwise show the loading indicator widget
      child: (_progress == 0 || _progress == 100)
          ? Icon(Icons.cloud_download)
          : CircularProgressIndicator(),
      onPressed: _downloadImage,
    );
  }
}
