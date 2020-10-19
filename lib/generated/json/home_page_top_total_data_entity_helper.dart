import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_total_data_entity.dart';

homePageTopTotalDataEntityFromJson(HomePageTopTotalDataEntity data, Map<String, dynamic> json) {
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
		data.data = new List<HomePageTopTotalDataData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HomePageTopTotalDataData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homePageTopTotalDataEntityToJson(HomePageTopTotalDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

homePageTopTotalDataDataFromJson(HomePageTopTotalDataData data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomePageTopTotalDataDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomePageTopTotalDataDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homePageTopTotalDataDataToJson(HomePageTopTotalDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homePageTopTotalDataDataListFromJson(HomePageTopTotalDataDataList data, Map<String, dynamic> json) {
	if (json['Key'] != null) {
		data.key = json['Key']?.toInt();
	}
	if (json['Value'] != null) {
		data.value = json['Value']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageTopTotalDataDataListToJson(HomePageTopTotalDataDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Key'] = entity.key;
	data['Value'] = entity.value;
	return data;
}