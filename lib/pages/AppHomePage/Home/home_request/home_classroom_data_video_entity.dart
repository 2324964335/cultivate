import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeClassroomDataVideoEntity with JsonConvert<HomeClassroomDataVideoEntity> {
	int success;
	String msg;
	int code;
	HomeClassroomDataVideoData data;
}

class HomeClassroomDataVideoData with JsonConvert<HomeClassroomDataVideoData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "FillPath")
	String fillPath;
	@JSONField(name: "FillType")
	String fillType;
	@JSONField(name: "Category")
	String category;
}
