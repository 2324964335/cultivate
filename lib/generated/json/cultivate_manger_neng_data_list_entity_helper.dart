import 'package:cultivate/pages/AppHomePage/Home/home_request/cultivate_manger_neng_data_list_entity.dart';

cultivateMangerNengDataListEntityFromJson(CultivateMangerNengDataListEntity data, Map<String, dynamic> json) {
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
		data.data = new List<CultivateMangerNengDataListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CultivateMangerNengDataListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cultivateMangerNengDataListEntityToJson(CultivateMangerNengDataListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

cultivateMangerNengDataListDataFromJson(CultivateMangerNengDataListData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['TeachType'] != null) {
		data.teachType = json['TeachType']?.toInt();
	}
	if (json['ClassType'] != null) {
		data.classType = json['ClassType']?.toInt();
	}
	if (json['BizTime'] != null) {
		data.bizTime = json['BizTime']?.toString();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['OP_Regist'] != null) {
		data.opRegist = json['OP_Regist']?.toString();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	return data;
}

Map<String, dynamic> cultivateMangerNengDataListDataToJson(CultivateMangerNengDataListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['TeachType'] = entity.teachType;
	data['ClassType'] = entity.classType;
	data['BizTime'] = entity.bizTime;
	data['Title'] = entity.title;
	data['OP_Regist'] = entity.opRegist;
	data['Icon'] = entity.icon;
	return data;
}