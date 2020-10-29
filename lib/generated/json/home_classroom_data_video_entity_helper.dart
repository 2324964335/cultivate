import 'package:cultivate/pages/AppHomePage/Home/home_request/home_classroom_data_video_entity.dart';

homeClassroomDataVideoEntityFromJson(HomeClassroomDataVideoEntity data, Map<String, dynamic> json) {
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
		data.data = new HomeClassroomDataVideoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homeClassroomDataVideoEntityToJson(HomeClassroomDataVideoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

homeClassroomDataVideoDataFromJson(HomeClassroomDataVideoData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['FillPath'] != null) {
		data.fillPath = json['FillPath']?.toString();
	}
	if (json['FillType'] != null) {
		data.fillType = json['FillType']?.toString();
	}
	return data;
}

Map<String, dynamic> homeClassroomDataVideoDataToJson(HomeClassroomDataVideoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['FillPath'] = entity.fillPath;
	data['FillType'] = entity.fillType;
	return data;
}