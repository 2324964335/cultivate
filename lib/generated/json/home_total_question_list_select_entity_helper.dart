import 'package:cultivate/pages/AppHomePage/Home/home_request/home_total_question_list_select_entity.dart';

homeTotalQuestionListSelectEntityFromJson(HomeTotalQuestionListSelectEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeTotalQuestionListSelectList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeTotalQuestionListSelectList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeTotalQuestionListSelectEntityToJson(HomeTotalQuestionListSelectEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeTotalQuestionListSelectListFromJson(HomeTotalQuestionListSelectList data, Map<String, dynamic> json) {
	if (json['SheetCode'] != null) {
		data.sheetCode = json['SheetCode']?.toString();
	}
	if (json['Caption'] != null) {
		data.caption = json['Caption']?.toString();
	}
	if (json['Count'] != null) {
		data.count = json['Count']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeTotalQuestionListSelectListToJson(HomeTotalQuestionListSelectList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SheetCode'] = entity.sheetCode;
	data['Caption'] = entity.caption;
	data['Count'] = entity.count;
	return data;
}