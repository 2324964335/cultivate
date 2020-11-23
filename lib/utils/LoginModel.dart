class UserModel{
  String nickname;
  String MobilePhone;
  String realname;
  String HeadImgPath;
  String Name;
  String uid;
  String TokenID = "";
  String TenantID = "";
  String Category = "";
  String AccountID = "";
  String RefreshToken = "";
  String Job = "";
  int IsAdmin = 0;
  String WardName = "";
  String JobTitle = "";
  String NurseLevel = "";
  String WorkNo = "";
  String WardCode = "";


  UserModel.fromMap(Map<String, dynamic> json) {
    this.nickname = json["nickname"].toString();
    this.MobilePhone = json["MobilePhone"].toString();
    this.realname = json["realname"].toString();
    this.HeadImgPath = "http://app.hosmart.com:7194/" + json["HeadImgPath"].toString();
    this.Name = json["Name"].toString();
    this.uid = json["uid"].toString();
    this.TokenID = json["TokenID"].toString();
    this.TenantID = json["TenantID"].toString();
    this.Category = json["Category"].toString();
    this.AccountID = json["AccountID"].toString();
    this.RefreshToken = json["RefreshToken"].toString();
    this.Job = json["Job"].toString();
    this.IsAdmin = json["IsAdmin"];
    this.WardName = json["WardName"].toString();
    this.JobTitle = json["JobTitle"].toString();
    this.NurseLevel = json["NurseLevel"].toString();
    this.WorkNo = json["WorkNo"].toString();
    this.WardCode = json["WardCode"].toString();
  }
}