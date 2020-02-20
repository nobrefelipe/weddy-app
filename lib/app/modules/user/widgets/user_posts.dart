import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/models/post_model.dart';
import 'package:weddy/app/shared/widgets/image_loader.dart';

/*
  USER POSTS WIDGET
  This is the grid view respansable for displaying the posts

  Receives a List of userPosts from the UserPage

  @param userPosts, a list of user posts
*/
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
        /*
          Post items
          wrap each item with a GestureDetector
          so we can listen to clicks on the picture
        */
        return GestureDetector(
          /*
            This container will have a light grey background color 
            and borders separating each picture
          */
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.black,
                width: 0.2,
              ),
            ),
            /*
              Post image
            */
            child: ImageLoader(image: userPosts[index].thumbnailUrl),
            
            
          ),
          /*
            On tap navigate to the post
            The route is set in PostModule:
            "/post/:id"
            Router('/:id', child: (_, args) => PostPage(id: args.params['id'])),
          */
          onTap: () => Modular.to.pushNamed("/post/${userPosts[index].uid}"),
        );
      },
    );
  }
}
