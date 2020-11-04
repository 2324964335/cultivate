import 'package:cultivate/pages/AppHomePage/Home/home_request/current_month_examine_list_entity.dart';

currentMonthExamineListEntityFromJson(CurrentMonthExamineListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<CurrentMonthExamineListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new CurrentMonthExamineListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> currentMonthExamineListEntityToJson(CurrentMonthExamineListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

currentMonthExamineListListFromJson(CurrentMonthExamineListList data, Map<String, dynamic> json) {
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
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
	if (json['Category'] != null) {
		data.category = json['Category']?.toInt();
	}
	return data;
}

Map<String, dynamic> currentMonthExamineListListToJson(CurrentMonthExamineListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Title'] = entity.title;
	data['Status'] = entity.status;
	data['BeginTime'] = entity.beginTime;
	data['EndTime'] = entity.endTime;
	data['Address'] = entity.address;
	data['Score'] = entity.score;
	data['ID'] = entity.iD;
	data['Category'] = entity.category;
	return data;
}