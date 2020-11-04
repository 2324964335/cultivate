import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class CurrentMonthExamineListEntity with JsonConvert<CurrentMonthExamineListEntity> {
	@JSONField(name: "list")
	List<CurrentMonthExamineListList> xList;
}

class CurrentMonthExamineListList with JsonConvert<CurrentMonthExamineListList> {
	@JSONField(name: "Title")
	String title;
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
	@JSONField(name: "Category")
	int category;
}
