class UserModel{
  String nickname;
  String mobile;
  String realname;
  String avatar;
  String Name;
  String uid;
  String TokenID = "";
  String TenantID = "";
  String Category = "";
  String AccountID = "";
  String RefreshToken = "";
  UserModel.fromMap(Map<String, dynamic> json) {
    this.nickname = json["nickname"].toString();
    this.mobile = json["mobile"].toString();
    this.realname = json["realname"].toString();
    this.avatar = json["avatar"].toString();
    this.Name = json["Name"].toString();
    this.uid = json["uid"].toString();
    this.TokenID = json["token"].toString();
    this.TenantID = json["TenantID"].toString();
    this.Category = json["Category"].toString();
    this.AccountID = json["AccountID"].toString();
    this.RefreshToken = json["RefreshToken"].toString();
  }
}