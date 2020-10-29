import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeClassroomDataEntity with JsonConvert<HomeClassroomDataEntity> {
	int success;
	String msg;
	int code;
	List<HomeClassroomDataData> data;
}

class HomeClassroomDataData with JsonConvert<HomeClassroomDataData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Images")
	String images;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Category")
	String category;
	@JSONField(name: "Score")
	double score;
	@JSONField(name: "LearnCount")
	int learnCount;
}
