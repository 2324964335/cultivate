class UserModel{
  String nickname;
  String mobile;
  String realname;
  String avatar;
  String username;
  String uid;
  String token = "";
  UserModel.fromMap(Map<String, dynamic> json) {
    this.nickname = json["nickname"].toString();
    this.mobile = json["mobile"].toString();
    this.realname = json["realname"].toString();
    this.avatar = json["avatar"].toString();
    this.username = json["username"].toString();
    this.uid = json["uid"].toString();
    this.token = json["token"].toString();
  }
}