import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/is_complete_feedback.dart';
import 'package:weddy/app/shared/widgets/linear_progress_indicator.dart';

/*
  This widget is responsable for displaying the downlod button
  and dowanload the picture
  It also displays a feedback message when the download is finished
*/
class Downloader extends StatefulWidget {
  /*
    Receive the image path from the parent widget
    this will be the image path that we get from the Image Picker plugin
  */
  final imageURL;
  const Downloader({Key key, this.imageURL}) : super(key: key);

  @override
  _DownloaderState createState() => _DownloaderState();
}


class _DownloaderState extends State<Downloader> {

  /*
    Download progress 
  */
  double _progress = 0.0;


  /*
    As we need to watch the progress of the dowanload
    we init the onProgressUpdate callback of the ImageDownloader plugin
    it need to be intiated on the initState of the widget
    When the download starts it will update the _progress variable
  */
  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress.toDouble();
      });
    });
  }

  /*
    Dowanload the image
    ImageDownloader plugin will dowanload the image
    we just need to provide the path
  */
  Future<void> _downloadImage() async {
    await ImageDownloader.downloadImage(widget.imageURL);
  }

  @override
  Widget build(BuildContext context) {

    /*
      If the _progress is wqual to 0
      means that the download is not started yet
      so we show the download button
    */
    if (_progress == 0) return downloadButton();

    /*
      If the _progress is equal to 100
      means the download is finished
      so we show the feedback message
      IsCompleteFeedback widget will also display a back to home button
    */
    if (_progress == 100)
      return IsCompleteFeedback(
          message: "All done! You can find the picture \n in your device's gallery");

    /*
      If the _progress is between 0 and 100
      means the download is in progress
      so we show the pregress indicator bar
    */
    if (_progress < 100 && _progress > 0)
      return CustomLinearProgressIndicator(progressPercent: _progress);
    else 
      return Container();  
  }

  /*
    Download button
  */
  downloadButton() {
    return Column(
      children: [
        /*
          Button
        */
        RaisedButton(
          color: AppStyles.primaryColor,
          elevation: 10,
          padding: EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              /*  
                Dowanload icon
              */
              Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              /*
                Download text
              */
              Text(
                "DOWNLOAD",
                style: AppStyles.h4_white,
              ),
            ],
          ),
          /*
            Call _downloadImage() when the button is pressed
          */
          onPressed: _downloadImage,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
