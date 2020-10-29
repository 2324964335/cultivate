import 'package:cultivate/pages/AppHomePage/Home/home_request/home_classroom_data_entity.dart';

homeClassroomDataEntityFromJson(HomeClassroomDataEntity data, Map<String, dynamic> json) {
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
		data.data = new List<HomeClassroomDataData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HomeClassroomDataData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeClassroomDataEntityToJson(HomeClassroomDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

homeClassroomDataDataFromJson(HomeClassroomDataData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Images'] != null) {
		data.images = json['Images']?.toString();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Category'] != null) {
		data.category = json['Category']?.toString();
	}
	if (json['Score'] != null) {
		data.score = json['Score']?.toDouble();
	}
	if (json['LearnCount'] != null) {
		data.learnCount = json['LearnCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeClassroomDataDataToJson(HomeClassroomDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Images'] = entity.images;
	data['Title'] = entity.title;
	data['Category'] = entity.category;
	data['Score'] = entity.score;
	data['LearnCount'] = entity.learnCount;
	return data;
}