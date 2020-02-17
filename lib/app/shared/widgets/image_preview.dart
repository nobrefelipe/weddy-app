import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        // If the image is from the device (upload preview)
        child: isFromDevice
            ? Image.file(
                imageURL,
                fit: BoxFit.contain,
              )
            : CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: imageURL,
                placeholder: (context, url) {
                  return Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.black12,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
      ),
    );
  }
}
