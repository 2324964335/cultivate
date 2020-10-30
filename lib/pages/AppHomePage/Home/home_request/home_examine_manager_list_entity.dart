import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeExamineManagerListEntity with JsonConvert<HomeExamineManagerListEntity> {
	@JSONField(name: "list")
	List<HomeExamineManagerListList> xList;
}

class HomeExamineManagerListList with JsonConvert<HomeExamineManagerListList> {
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "SignInTime")
	String signInTime;
	@JSONField(name: "Status")
	int status;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "EndTime")
	String endTime;
	@JSONField(name: "Address")
	String address;
	@JSONField(name: "Score")
	double score;
	@JSONField(name: "ID")
	int iD;
}
