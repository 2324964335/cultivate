import 'package:cultivate/pages/AppHomePage/Home/home_request/cultivate_manger_level_model_entity.dart';

cultivateMangerLevelModelEntityFromJson(CultivateMangerLevelModelEntity data, Map<String, dynamic> json) {
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
		data.data = new List<CultivateMangerLevelModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CultivateMangerLevelModelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cultivateMangerLevelModelEntityToJson(CultivateMangerLevelModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

cultivateMangerLevelModelDataFromJson(CultivateMangerLevelModelData data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	return data;
}

Map<String, dynamic> cultivateMangerLevelModelDataToJson(CultivateMangerLevelModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	data['Name'] = entity.name;
	return data;
}