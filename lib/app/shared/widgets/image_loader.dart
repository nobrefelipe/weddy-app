import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/*
  IMAGE LOADER
  This widget is a wrapper for the CachedNetworkImage plugin
  CachedNetworkImage will load the image from the network
  and save it on cache so the user only loads it once

  @param image, is the image url

*/
class ImageLoader extends StatelessWidget {
  final String image;
  const ImageLoader({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      placeholder: (context, url) {
        return Container(
          width: double.infinity,
          height: 100,
          color: Colors.black12,
        );
      },
    );
  }
}
