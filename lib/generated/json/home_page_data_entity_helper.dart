import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_data_entity.dart';

homePageDataEntityFromJson(HomePageDataEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomePageDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomePageDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homePageDataEntityToJson(HomePageDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homePageDataListFromJson(HomePageDataList data, Map<String, dynamic> json) {
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Type'] != null) {
		data.type = json['Type']?.toInt();
	}
	if (json['ReadType'] != null) {
		data.readType = json['ReadType']?.toInt();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['Trainer'] != null) {
		data.trainer = json['Trainer']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	if (json['LikeCount'] != null) {
		data.likeCount = json['LikeCount']?.toInt();
	}
	if (json['CommentCount'] != null) {
		data.commentCount = json['CommentCount']?.toInt();
	}
	if (json['ViewCount'] != null) {
		data.viewCount = json['ViewCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> homePageDataListToJson(HomePageDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Title'] = entity.title;
	data['Type'] = entity.type;
	data['ReadType'] = entity.readType;
	data['Icon'] = entity.icon;
	data['Trainer'] = entity.trainer;
	data['BeginTime'] = entity.beginTime;
	data['LikeCount'] = entity.likeCount;
	data['CommentCount'] = entity.commentCount;
	data['ViewCount'] = entity.viewCount;
	return data;
}