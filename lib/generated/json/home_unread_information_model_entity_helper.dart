import 'package:cultivate/pages/AppHomePage/Home/home_request/home_unread_information_model_entity.dart';

homeUnreadInformationModelEntityFromJson(HomeUnreadInformationModelEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeUnreadInformationModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeUnreadInformationModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeUnreadInformationModelEntityToJson(HomeUnreadInformationModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeUnreadInformationModelListFromJson(HomeUnreadInformationModelList data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['Trianer'] != null) {
		data.trianer = json['Trianer']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	if (json['Content'] != null) {
		data.content = json['Content']?.toString();
	}
	if (json['Likes'] != null) {
		data.likes = json['Likes']?.toInt();
	}
	if (json['Comments'] != null) {
		data.comments = json['Comments']?.toInt();
	}
	if (json['SeeCount'] != null) {
		data.seeCount = json['SeeCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeUnreadInformationModelListToJson(HomeUnreadInformationModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Title'] = entity.title;
	data['Icon'] = entity.icon;
	data['Trianer'] = entity.trianer;
	data['BeginTime'] = entity.beginTime;
	data['Content'] = entity.content;
	data['Likes'] = entity.likes;
	data['Comments'] = entity.comments;
	data['SeeCount'] = entity.seeCount;
	return data;
}