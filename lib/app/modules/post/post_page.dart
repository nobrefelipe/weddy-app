import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/post/post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/custom_back_button.dart';
import 'package:weddy/app/shared/widgets/image_preview.dart';

import 'widgets/downloader.dart';

/*
  This is the page that renders the post details
  It receives the post id as parameter
  The id comes from the route url /post/:id (see post_module.dart)

  @param id, the post id
*/

class PostPage extends StatefulWidget {
  /*
    Post id
  */
  final String id;
  const PostPage({Key key, this.id}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  /*
    Instanciate the Post Controller
  */
  final _guestsController = Modular.get<PostController>();

  // Post
  Future post;

  /*
    Get the post by the id
    do it on the initState to make sure we always get it when the users access this view
  */
  @override
  void initState() {
    post = _guestsController.getPost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
      Size of viewport used to get the width and height
    */
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.appBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
            Custom back button
          */
          Padding(
            padding: EdgeInsets.only(top: 60.0, left: 10.0),
            child: CustomBackButton(),
          ),

          /*
            Post content
            1. Post image
            2. Dwnload button
            3. feedback message + return to home button (managed by Downloader widget)
          */
          Expanded(
            /*
              Use a SingleChildScrollView inside a Expanded 
              to make sure the content is scrollable and fill the page
            */
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  /*
                    Image preview
                    Observe for changes in the post observable in the controller
                    so we update the content with the right data
                  */
                  Observer(
                    builder: (_) {
                      return
                          /*
                             If the post is there
                          */
                          (_guestsController.post != null)
                              /*
                                show the preview image
                              */
                              ? Container(
                                  width: 280,
                                  child: ImagePreview(
                                    imageURL: _guestsController.post.imageUrl,
                                  ),
                                )
                              :
                              /*
                                otherwise, show the loading box
                              */
                              Container(
                                  width: size.width - 100,
                                  height: 300,
                                  color: Colors.black12,
                                  child: Center(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  /*
                    Download button 
                  */
                  Center(
                    child: Observer(
                      builder: (_) {
                        return
                            /*
                              If the post is there
                            */
                            (_guestsController.post != null)
                                /*
                                  Show the download button
                                  The Downloader widget is responsable for downloading the image
                                  and displaying a feed back for the user
                                */
                                ? Downloader(
                                    imageURL: _guestsController.post.imageUrl)
                                :
                                /*  
                                  otherwise, show nothing
                                */
                                Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
