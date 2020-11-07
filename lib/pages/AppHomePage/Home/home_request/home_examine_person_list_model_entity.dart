import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeExaminePersonListModelEntity with JsonConvert<HomeExaminePersonListModelEntity> {
	@JSONField(name: "list")
	List<HomeExaminePersonListModelList> xList;
}

class HomeExaminePersonListModelList with JsonConvert<HomeExaminePersonListModelList> {
	@JSONField(name: "ExamineItem")
	int examinItem;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "WorkNo")
	String workNo;
	@JSONField(name: "SheetCode")
	String sheetCode;
	@JSONField(name: "WorkName")
	String workName;
	@JSONField(name: "WardName")
	String wardName;
	@JSONField(name: "TS_Create")
	String tS_Create;
	@JSONField(name: "WardCode")
	String wardCode;
}
