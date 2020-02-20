import 'package:flutter/material.dart';
import 'package:weddy/app/shared/widgets/image_loader.dart';

/*
  IMAGE PREVIEW
  This widget renders the image preview on the Post and Download pages

  @param isFromDevice,
  @param imageURL, 
*/

class ImagePreview extends StatelessWidget {
  final isFromDevice;
  final imageURL;
  const ImagePreview({Key key, this.imageURL, this.isFromDevice = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 14.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 5
              5.0, // vertical, move down 5
            ),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        /*
          If the image is from the device (upload preview)
          this means the image is coming from the user selection 
          (upload screen)
        */
        child: isFromDevice
            ? Image.file(
                imageURL,
                fit: BoxFit.contain,
              )
            : 
            /*
              If the image is from the network (download screen)
              use the image loader widget
            */
            ImageLoader(image: imageURL)
           
      ),
    );
  }
}
