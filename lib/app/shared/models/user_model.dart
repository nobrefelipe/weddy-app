

import 'package:weddy/app/shared/models/post_model.dart';

class UserModel {
  String name;
  String picture;
  String email;
  String surname;
  String userUid;
  List<PostModel> posts;

  UserModel({this.name, this.picture, this.email, this.surname, this.userUid, this.posts});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    picture = json['picture'];
    email = json['email'];
    surname = json['surname'];
    userUid = json['id'];
    if (json['posts'] != null) {
      posts = new List<PostModel>();
      json['posts'].forEach((v) {
        posts.add(new PostModel.fromJson(v));
      });
    }
  }

  static List<UserModel> fromJsonList(List list) {
    if(list == null) return null;

    return list.map<UserModel>( (item) => UserModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['id'] = this.userUid;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}