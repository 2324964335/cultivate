import 'package:cultivate/pages/AppHomePage/Home/home_request/home_unread_information_detail_model_entity.dart';

homeUnreadInformationDetailModelEntityFromJson(HomeUnreadInformationDetailModelEntity data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Status'] != null) {
		data.status = json['Status']?.toInt();
	}
	if (json['OP_Regist'] != null) {
		data.opRegist = json['OP_Regist']?.toString();
	}
	if (json['EduCategory'] != null) {
		data.eduCategory = json['EduCategory']?.toString();
	}
	if (json['ClassType'] != null) {
		data.classType = json['ClassType']?.toString();
	}
	if (json['TS_Regist'] != null) {
		data.tsRegist = json['TS_Regist']?.toString();
	}
	if (json['Address'] != null) {
		data.address = json['Address']?.toString();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Content'] != null) {
		data.content = json['Content']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	if (json['Endtime'] != null) {
		data.endtime = json['Endtime']?.toString();
	}
	if (json['Trainer'] != null) {
		data.trainer = json['Trainer']?.toString();
	}
	if (json['MembersEndTime'] != null) {
		data.membersEndTime = json['MembersEndTime']?.toString();
	}
	if (json['EduObject'] != null) {
		data.eduObject = json['EduObject']?.toString();
	}
	if (json['SignInTime'] != null) {
		data.signInTime = json['SignInTime']?.toString();
	}
	if (json['Trainee_Score'] != null) {
		data.traineeScore = json['Trainee_Score']?.toString();
	}
	if (json['PersonCount'] != null) {
		data.personCount = json['PersonCount']?.toInt();
	}
	if (json['PersonMax'] != null) {
		data.personMax = json['PersonMax']?.toInt();
	}
	if (json['Likes'] != null) {
		data.likes = json['Likes']?.toInt();
	}
	if (json['SeeCount'] != null) {
		data.seeCount = json['SeeCount']?.toInt();
	}
	if (json['Comments'] != null) {
		data.comments = json['Comments']?.toInt();
	}
	if (json['ST_MyLike'] != null) {
		data.stMylike = json['ST_MyLike']?.toInt();
	}
	if (json['ST_MyComment'] != null) {
		data.stMycomment = json['ST_MyComment']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeUnreadInformationDetailModelEntityToJson(HomeUnreadInformationDetailModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Status'] = entity.status;
	data['OP_Regist'] = entity.opRegist;
	data['EduCategory'] = entity.eduCategory;
	data['ClassType'] = entity.classType;
	data['TS_Regist'] = entity.tsRegist;
	data['Address'] = entity.address;
	data['Title'] = entity.title;
	data['Content'] = entity.content;
	data['BeginTime'] = entity.beginTime;
	data['Endtime'] = entity.endtime;
	data['Trainer'] = entity.trainer;
	data['MembersEndTime'] = entity.membersEndTime;
	data['EduObject'] = entity.eduObject;
	data['SignInTime'] = entity.signInTime;
	data['Trainee_Score'] = entity.traineeScore;
	data['PersonCount'] = entity.personCount;
	data['PersonMax'] = entity.personMax;
	data['Likes'] = entity.likes;
	data['SeeCount'] = entity.seeCount;
	data['Comments'] = entity.comments;
	data['ST_MyLike'] = entity.stMylike;
	data['ST_MyComment'] = entity.stMycomment;
	return data;
}