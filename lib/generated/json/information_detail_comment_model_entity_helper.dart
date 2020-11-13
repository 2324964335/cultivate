import 'package:cultivate/pages/AppHomePage/Home/home_request/information_detail_comment_model_entity.dart';

informationDetailCommentModelEntityFromJson(InformationDetailCommentModelEntity data, Map<String, dynamic> json) {
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
		data.data = new InformationDetailCommentModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> informationDetailCommentModelEntityToJson(InformationDetailCommentModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

informationDetailCommentModelDataFromJson(InformationDetailCommentModelData data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<InformationDetailCommantModelDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new InformationDetailCommantModelDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> informationDetailCommentModelDataToJson(InformationDetailCommentModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

informationDetailCommantModelDataListFromJson(InformationDetailCommantModelDataList data, Map<String, dynamic> json) {
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['TS_Comment'] != null) {
		data.tsComment = json['TS_Comment']?.toString();
	}
	if (json['Comment'] != null) {
		data.comment = json['Comment']?.toString();
	}
	return data;
}

Map<String, dynamic> informationDetailCommantModelDataListToJson(InformationDetailCommantModelDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Name'] = entity.name;
	data['Icon'] = entity.icon;
	data['TS_Comment'] = entity.tsComment;
	data['Comment'] = entity.comment;
	return data;
}