import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeVideoLearnBottomModelEntity with JsonConvert<HomeVideoLearnBottomModelEntity> {
	int success;
	String msg;
	int code;
	List<HomeVideoLearnBottomModelData> data;
}

class HomeVideoLearnBottomModelData with JsonConvert<HomeVideoLearnBottomModelData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Score")
	double score;
	@JSONField(name: "LearnCount")
	int learnCount;
	@JSONField(name: "Ord")
	int ord;
}
