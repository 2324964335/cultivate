import 'package:cultivate/pages/AppHomePage/Home/home_request/my_cultivate_detail_top_total_entity.dart';

myCultivateDetailTopTotalEntityFromJson(MyCultivateDetailTopTotalEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<MyCultivateDetailTopTotalList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new MyCultivateDetailTopTotalList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> myCultivateDetailTopTotalEntityToJson(MyCultivateDetailTopTotalEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

myCultivateDetailTopTotalListFromJson(MyCultivateDetailTopTotalList data, Map<String, dynamic> json) {
	if (json['Key'] != null) {
		data.key = json['Key']?.toInt();
	}
	if (json['Value'] != null) {
		data.value = json['Value']?.toString();
	}
	return data;
}

Map<String, dynamic> myCultivateDetailTopTotalListToJson(MyCultivateDetailTopTotalList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Key'] = entity.key;
	data['Value'] = entity.value;
	return data;
}