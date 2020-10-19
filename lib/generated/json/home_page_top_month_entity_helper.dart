import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_month_entity.dart';

homePageTopMonthEntityFromJson(HomePageTopMonthEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomePageTopMonthList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomePageTopMonthList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homePageTopMonthEntityToJson(HomePageTopMonthEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homePageTopMonthListFromJson(HomePageTopMonthList data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageTopMonthListToJson(HomePageTopMonthList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['key'] = entity.key;
	return data;
}