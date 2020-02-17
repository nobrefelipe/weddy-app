import 'package:flutter/material.dart';
import 'package:weddy/app/modules/post/widgets/tag_widget.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/post_author.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        /** POST AUTHOR **/
        child: Container(
          //Align the content to the top left of the container
          alignment: Alignment(-1.0, -1.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /** POST AUTHOR **/
              // PostAuthor(),
              SizedBox(height: 20),

              /** POST PEOPLE TAGGED **/
              Text("People in this picture", style: AppStyles.body_text_medium),
              /** TAGS **/
              Wrap(
                children: [
                  TagWidget(),
                  TagWidget(),
                  TagWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
