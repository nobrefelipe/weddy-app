import 'package:weddy/app/shared/models/user_model.dart';

class PostModel {
  String uid;
  String imageUrl;
  String thumbnailUrl;
  UserModel user;

  PostModel({this.uid, this.imageUrl, this.user});

  PostModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    imageUrl = json['image_url'];
    thumbnailUrl = json['thumbnail_url'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  static List<PostModel> fromJsonList(List list) {
    if(list == null) return null;

    return list.map<PostModel>( (item) => PostModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['image_url'] = this.imageUrl;
    data['thumbnail_url'] = this.imageUrl;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}