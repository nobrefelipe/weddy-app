import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostItemImage extends StatelessWidget {
  // PostItemImage will receive the image url and id from the parent
  final String id;
  final String img;
  const PostItemImage({
    Key key,
    this.id,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    5.0, // horizontal, move right 5
                    5.0, // vertical, move down 5
                  ),
                )
              ],
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // On tap navigate to the post view
          // passing the id of the post
          onTap: () => Modular.to.pushNamed("/post/$id"),
        ),
      ),
    );
  }
}
