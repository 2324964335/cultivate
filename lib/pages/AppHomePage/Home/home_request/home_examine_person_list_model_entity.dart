import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeExaminePersonListModelEntity with JsonConvert<HomeExaminePersonListModelEntity> {
	@JSONField(name: "list")
	List<HomeExaminePersonListModelList> xList;
}

class HomeExaminePersonListModelList with JsonConvert<HomeExaminePersonListModelList> {
	@JSONField(name: "ExaminItemID")
	int examinItemID;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "WorkNo")
	String workNo;
	@JSONField(name: "WorkName")
	String workName;
	@JSONField(name: "WardName")
	String wardName;
	@JSONField(name: "Date")
	String date;
}
