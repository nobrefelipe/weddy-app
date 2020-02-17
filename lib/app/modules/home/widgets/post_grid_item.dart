import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/home/widgets/post_grid_item_image.dart';
import 'package:weddy/app/shared/models/post_model.dart';
import 'package:weddy/app/shared/widgets/post_author.dart';

class PostItem extends StatelessWidget {
  // PostItem will receive the post object from the grid view
  final PostModel postItem;
  const PostItem({Key key, this.postItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /** POST AUTHOR **/
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            onTap: () => Modular.to.pushNamed("user"),
            child: PostAuthor(
              // vai receber o author do post passado pelo pai
              size: "small",
              userData: postItem.user,
            ),
          ),
        ),

        /** POST PICTURE **/
        PostItemImage(
          id: postItem.uid,
          img: postItem.thumbnailUrl,
        ),
      ],
    );
  }
}
