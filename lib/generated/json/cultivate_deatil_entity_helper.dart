import 'package:cultivate/pages/AppHomePage/Home/home_request/cultivate_deatil_entity.dart';

cultivateDeatilEntityFromJson(CultivateDeatilEntity data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Banner'] != null) {
		data.banner = json['Banner']?.toString();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Trainer'] != null) {
		data.trainer = json['Trainer']?.toString();
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
	if (json['TrainingObjects'] != null) {
		data.trainingObjects = json['TrainingObjects']?.toString();
	}
	if (json['JoinCount'] != null) {
		data.joinCount = json['JoinCount']?.toInt();
	}
	if (json['PersonCount'] != null) {
		data.personCount = json['PersonCount']?.toInt();
	}
	if (json['OP_Regist'] != null) {
		data.oP_Regist = json['OP_Regist']?.toString();
	}
	if (json['ReleaseTime'] != null) {
		data.releaseTime = json['ReleaseTime']?.toString();
	}
	return data;
}

Map<String, dynamic> cultivateDeatilEntityToJson(CultivateDeatilEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Banner'] = entity.banner;
	data['Title'] = entity.title;
	data['Trainer'] = entity.trainer;
	data['BeginTime'] = entity.beginTime;
	data['EndTime'] = entity.endTime;
	data['Address'] = entity.address;
	data['TrainingObjects'] = entity.trainingObjects;
	data['JoinCount'] = entity.joinCount;
	data['PersonCount'] = entity.personCount;
	data['OP_Regist'] = entity.oP_Regist;
	data['ReleaseTime'] = entity.releaseTime;
	return data;
}