import 'package:cultivate/pages/AppHomePage/Message/message_request/message_model_list_entity.dart';

messageModelListEntityFromJson(MessageModelListEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<MessageModelListList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new MessageModelListList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> messageModelListEntityToJson(MessageModelListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

messageModelListListFromJson(MessageModelListList data, Map<String, dynamic> json) {
	if (json['MessageID'] != null) {
		data.messageID = json['MessageID']?.toInt();
	}
	if (json['LinkID'] != null) {
		data.linkID = json['LinkID']?.toString();
	}
	if (json['LinkType'] != null) {
		data.linkType = json['LinkType']?.toInt();
	}
	if (json['ST_See'] != null) {
		data.stSee = json['ST_See']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Content'] != null) {
		data.content = json['Content']?.toString();
	}
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['senderObjName'] != null) {
		data.senderObjName = json['senderObjName']?.toString();
	}
	if (json['BeginTime'] != null) {
		data.beginTime = json['BeginTime']?.toString();
	}
	return data;
}

Map<String, dynamic> messageModelListListToJson(MessageModelListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['MessageID'] = entity.messageID;
	data['LinkID'] = entity.linkID;
	data['LinkType'] = entity.linkType;
	data['ST_See'] = entity.stSee;
	data['Title'] = entity.title;
	data['Content'] = entity.content;
	data['Icon'] = entity.icon;
	data['senderObjName'] = entity.senderObjName;
	data['BeginTime'] = entity.beginTime;
	return data;
}