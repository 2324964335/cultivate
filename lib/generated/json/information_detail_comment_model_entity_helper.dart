import 'package:cultivate/pages/AppHomePage/Home/home_request/information_detail_comment_model_entity.dart';

informationDetailCommentModelEntityFromJson(InformationDetailCommentModelEntity data, Map<String, dynamic> json) {
	if (json['success'] != null) {
		data.success = json['success']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new InformationDetailCommentModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> informationDetailCommentModelEntityToJson(InformationDetailCommentModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

informationDetailCommentModelDataFromJson(InformationDetailCommentModelData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Status'] != null) {
		data.status = json['Status']?.toInt();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['OP_Regist'] != null) {
		data.opRegist = json['OP_Regist']?.toString();
	}
	if (json['Address'] != null) {
		data.address = json['Address']?.toString();
	}
	if (json['TS_Regist'] != null) {
		data.tsRegist = json['TS_Regist']?.toString();
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
	if (json['ST_MyLike'] != null) {
		data.sT_MyLike = json['ST_MyLike']?.toInt();
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
	if (json['list'] != null) {
		data.xList = new List<InformationDetailCommantModelDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new InformationDetailCommantModelDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> informationDetailCommentModelDataToJson(InformationDetailCommentModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Status'] = entity.status;
	data['Icon'] = entity.icon;
	data['OP_Regist'] = entity.opRegist;
	data['Address'] = entity.address;
	data['TS_Regist'] = entity.tsRegist;
	data['Title'] = entity.title;
	data['Content'] = entity.content;
	data['BeginTime'] = entity.beginTime;
	data['Endtime'] = entity.endtime;
	data['Trainer'] = entity.trainer;
	data['MembersEndTime'] = entity.membersEndTime;
	data['SignInTime'] = entity.signInTime;
	data['Trainee_Score'] = entity.traineeScore;
	data['PersonCount'] = entity.personCount;
	data['PersonMax'] = entity.personMax;
	data['ST_MyLike'] = entity.sT_MyLike;
	data['Likes'] = entity.likes;
	data['SeeCount'] = entity.seeCount;
	data['Comments'] = entity.comments;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

informationDetailCommantModelDataListFromJson(InformationDetailCommantModelDataList data, Map<String, dynamic> json) {
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['TS_Comment'] != null) {
		data.tsComment = json['TS_Comment']?.toString();
	}
	if (json['Comment'] != null) {
		data.comment = json['Comment']?.toString();
	}
	return data;
}

Map<String, dynamic> informationDetailCommantModelDataListToJson(InformationDetailCommantModelDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Name'] = entity.name;
	data['Icon'] = entity.icon;
	data['TS_Comment'] = entity.tsComment;
	data['Comment'] = entity.comment;
	return data;
}