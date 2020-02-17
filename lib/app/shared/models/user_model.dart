

class UserModel {
  String name;
  String picture;
  String email;
  String surname;
  String userUid;

  UserModel({this.name, this.picture, this.email, this.surname, this.userUid});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    picture = json['picture'];
    email = json['email'];
    surname = json['surname'];
    userUid = json['user_uid'];
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
    data['user_uid'] = this.userUid;
    return data;
  }
}