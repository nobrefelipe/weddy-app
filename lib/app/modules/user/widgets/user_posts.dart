import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/models/post_model.dart';

class UserPosts extends StatelessWidget {

  final List<PostModel> userPosts;
  const UserPosts({Key key, this.userPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: false,
      itemCount: userPosts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        //** POST ITEMS **/
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.black,
                width: 0.2,
              ),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: userPosts[index].thumbnailUrl,
              placeholder: (context, url) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.black12,
                  
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          onTap: () => Modular.to.pushNamed("/post"),
        );
      },
    );
  }
}
