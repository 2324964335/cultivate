import 'package:cultivate/pages/AppHomePage/Home/home_request/home_examine_manager_list_entity.dart';

homeExamineManagerListEntityFromJson(HomeExamineManagerListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeExamineManagerListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeExamineManagerListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeExamineManagerListEntityToJson(HomeExamineManagerListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeExamineManagerListListFromJson(HomeExamineManagerListList data, Map<String, dynamic> json) {
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['SignInTime'] != null) {
		data.signInTime = json['SignInTime']?.toString();
	}
	if (json['Status'] != null) {
		data.status = json['Status']?.toInt();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	if (json['EndTime'] != null) {
		data.endTime = json['EndTime']?.toString();
	}
	if (json['Address'] != null) {
		data.address = json['Address']?.toString();
	}
	if (json['Score'] != null) {
		data.score = json['Score']?.toDouble();
	}
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeExamineManagerListListToJson(HomeExamineManagerListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Title'] = entity.title;
	data['SignInTime'] = entity.signInTime;
	data['Status'] = entity.status;
	data['BeginTime'] = entity.beginTime;
	data['EndTime'] = entity.endTime;
	data['Address'] = entity.address;
	data['Score'] = entity.score;
	data['ID'] = entity.iD;
	return data;
}