import 'package:cultivate/pages/AppHomePage/Home/home_request/home_cultivate_mangager_list_entity.dart';

homeCultivateMangagerListEntityFromJson(HomeCultivateMangagerListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeCultivateMangagerListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeCultivateMangagerListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeCultivateMangagerListEntityToJson(HomeCultivateMangagerListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeCultivateMangagerListListFromJson(HomeCultivateMangagerListList data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['SignInTime'] != null) {
		data.signInTime = json['SignInTime']?.toString();
	}
	if (json['OP_Regist'] != null) {
		data.opRegist = json['OP_Regist']?.toString();
	}
	if (json['TS_Regist'] != null) {
		data.tsRegist = json['TS_Regist']?.toString();
	}
	if (json['Category'] != null) {
		data.category = json['Category']?.toString();
	}
	if (json['Status'] != null) {
		data.status = json['Status']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	return data;
}

Map<String, dynamic> homeCultivateMangagerListListToJson(HomeCultivateMangagerListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Title'] = entity.title;
	data['SignInTime'] = entity.signInTime;
	data['OP_Regist'] = entity.opRegist;
	data['TS_Regist'] = entity.tsRegist;
	data['Category'] = entity.category;
	data['Status'] = entity.status;
	data['BeginTime'] = entity.beginTime;
	return data;
}