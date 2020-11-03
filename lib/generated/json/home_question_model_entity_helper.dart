import 'package:cultivate/pages/AppHomePage/Examine/home_question_model_entity.dart';

homeQuestionModelEntityFromJson(HomeQuestionModelEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeQuestionModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeQuestionModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeQuestionModelEntityToJson(HomeQuestionModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeQuestionModelListFromJson(HomeQuestionModelList data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Type'] != null) {
		data.type = json['Type']?.toInt();
	}
	if (json['Answer'] != null) {
		data.answer = json['Answer']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['CorrectAnswer'] != null) {
		data.correctAnswer = json['CorrectAnswer']?.toString();
	}
	return data;
}

Map<String, dynamic> homeQuestionModelListToJson(HomeQuestionModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['Title'] = entity.title;
	data['Type'] = entity.type;
	data['Answer'] = entity.answer;
	data['CorrectAnswer'] = entity.correctAnswer;
	return data;
}