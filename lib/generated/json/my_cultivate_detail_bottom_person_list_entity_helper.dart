import 'package:cultivate/pages/AppHomePage/Home/home_request/my_cultivate_detail_bottom_person_list_entity.dart';

myCultivateDetailBottomPersonListEntityFromJson(MyCultivateDetailBottomPersonListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<MyCultivateDetailBottomPersonListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new MyCultivateDetailBottomPersonListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> myCultivateDetailBottomPersonListEntityToJson(MyCultivateDetailBottomPersonListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

myCultivateDetailBottomPersonListListFromJson(MyCultivateDetailBottomPersonListList data, Map<String, dynamic> json) {
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['TS_Signin'] != null) {
		data.tsSignin = json['TS_Signin']?.toString();
	}
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	return data;
}

Map<String, dynamic> myCultivateDetailBottomPersonListListToJson(MyCultivateDetailBottomPersonListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Icon'] = entity.icon;
	data['Name'] = entity.name;
	data['TS_Signin'] = entity.tsSignin;
	data['ID'] = entity.iD;
	return data;
}