import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeQuestionModelEntity with JsonConvert<HomeQuestionModelEntity> {
	@JSONField(name: "list")
	List<HomeQuestionModelList> xList;
}

class HomeQuestionModelList with JsonConvert<HomeQuestionModelList> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Type")
	int type;
	@JSONField(name: "Answer")
	List<String> answer;
	@JSONField(name: "CorrectAnswer")
	String correctAnswer;
}
