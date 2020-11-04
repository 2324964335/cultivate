import 'package:cultivate/pages/AppHomePage/Home/home_request/home_examine_person_list_model_entity.dart';

homeExaminePersonListModelEntityFromJson(HomeExaminePersonListModelEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeExaminePersonListModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeExaminePersonListModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeExaminePersonListModelEntityToJson(HomeExaminePersonListModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeExaminePersonListModelListFromJson(HomeExaminePersonListModelList data, Map<String, dynamic> json) {
	if (json['ExaminItemID'] != null) {
		data.examinItemID = json['ExaminItemID']?.toInt();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['WorkNo'] != null) {
		data.workNo = json['WorkNo']?.toString();
	}
	if (json['WorkName'] != null) {
		data.workName = json['WorkName']?.toString();
	}
	if (json['WardName'] != null) {
		data.wardName = json['WardName']?.toString();
	}
	if (json['Date'] != null) {
		data.date = json['Date']?.toString();
	}
	return data;
}

Map<String, dynamic> homeExaminePersonListModelListToJson(HomeExaminePersonListModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExaminItemID'] = entity.examinItemID;
	data['Icon'] = entity.icon;
	data['WorkNo'] = entity.workNo;
	data['WorkName'] = entity.workName;
	data['WardName'] = entity.wardName;
	data['Date'] = entity.date;
	return data;
}