import 'package:cultivate/pages/AppHomePage/Home/home_request/home_video_learn_bottom_model_entity.dart';

homeVideoLearnBottomModelEntityFromJson(HomeVideoLearnBottomModelEntity data, Map<String, dynamic> json) {
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
		data.data = new List<HomeVideoLearnBottomModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HomeVideoLearnBottomModelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeVideoLearnBottomModelEntityToJson(HomeVideoLearnBottomModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

homeVideoLearnBottomModelDataFromJson(HomeVideoLearnBottomModelData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Score'] != null) {
		data.score = json['Score']?.toDouble();
	}
	if (json['LearnCount'] != null) {
		data.learnCount = json['LearnCount']?.toInt();
	}
	if (json['Ord'] != null) {
		data.ord = json['Ord']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeVideoLearnBottomModelDataToJson(HomeVideoLearnBottomModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Title'] = entity.title;
	data['Score'] = entity.score;
	data['LearnCount'] = entity.learnCount;
	data['Ord'] = entity.ord;
	return data;
}