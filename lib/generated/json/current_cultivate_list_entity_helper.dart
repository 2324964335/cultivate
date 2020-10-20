import 'package:cultivate/pages/AppHomePage/Home/home_request/current_cultivate_list_entity.dart';

currentCultivateListEntityFromJson(CurrentCultivateListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<CurrentCultivateListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new CurrentCultivateListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> currentCultivateListEntityToJson(CurrentCultivateListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

currentCultivateListListFromJson(CurrentCultivateListList data, Map<String, dynamic> json) {
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Type'] != null) {
		data.type = json['Type']?.toInt();
	}
	if (json['Trainer'] != null) {
		data.trainer = json['Trainer']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	if (json['Address'] != null) {
		data.address = json['Address']?.toString();
	}
	if (json['PersonNumber'] != null) {
		data.personNumber = json['PersonNumber']?.toInt();
	}
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	return data;
}

Map<String, dynamic> currentCultivateListListToJson(CurrentCultivateListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Title'] = entity.title;
	data['Type'] = entity.type;
	data['Trainer'] = entity.trainer;
	data['BeginTime'] = entity.beginTime;
	data['Address'] = entity.address;
	data['PersonNumber'] = entity.personNumber;
	data['ID'] = entity.iD;
	return data;
}