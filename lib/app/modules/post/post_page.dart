import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/modules/post/post_controller.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/custom_back_button.dart';
import 'package:weddy/app/shared/widgets/image_preview.dart';

import 'widgets/downloader.dart';

class PostPage extends StatefulWidget {
  final String id;
  const PostPage({Key key, this.id}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // Instanciate the Post Controller
  final _guestsController = Modular.get<PostController>();

  // Post
  Future post;

  // Get the post by the id
  @override
  void initState() {
    post = _guestsController.getPost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size of viewport used to get the width and height
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.appBgColor,
      body: Stack(
        children: [
          // CUSTOM BACK BUTTOn
          Positioned(
            top: 60,
            left: 10,
            child: CustomBackButton(),
          ),
          Positioned(
            top: 150,
            left: (size.width / 2) - ((size.width - 100) / 2),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                maxWidth: size.width - 100,
              ),
              child: Column(
                children: [
                  /*
                   * IMAGE PREVIEW
                   */
                  Observer(
                    builder: (_) {
                      return
                          // if the post is there
                          (_guestsController.post != null)
                              // show the preview image
                              ? ImagePreview(
                                  imageURL: _guestsController.post.imageUrl)
                              :
                              // otherwise, show the loading box
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
                   * DOWNLOAD BUTTON
                   */
                  Center(
                    child: Observer(
                      builder: (_) {
                        return
                            // if the post is there
                            (_guestsController.post != null)
                                // show the download button
                                ? Downloader(
                                    imageURL: _guestsController.post.imageUrl)
                                :
                                // otherwise, show nothing
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
