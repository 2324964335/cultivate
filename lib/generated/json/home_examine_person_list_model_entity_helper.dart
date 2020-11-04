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
	if (json['ExamineItem'] != null) {
		data.examinItem = json['ExamineItem']?.toInt();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['WorkNo'] != null) {
		data.workNo = json['WorkNo']?.toString();
	}
	if (json['SheetCode'] != null) {
		data.sheetCode = json['SheetCode']?.toString();
	}
	if (json['WorkName'] != null) {
		data.workName = json['WorkName']?.toString();
	}
	if (json['WardName'] != null) {
		data.wardName = json['WardName']?.toString();
	}
	if (json['TS_Create'] != null) {
		data.tS_Create = json['TS_Create']?.toString();
	}
	return data;
}

Map<String, dynamic> homeExaminePersonListModelListToJson(HomeExaminePersonListModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExamineItem'] = entity.examinItem;
	data['Icon'] = entity.icon;
	data['WorkNo'] = entity.workNo;
	data['SheetCode'] = entity.sheetCode;
	data['WorkName'] = entity.workName;
	data['WardName'] = entity.wardName;
	data['TS_Create'] = entity.tS_Create;
	return data;
}