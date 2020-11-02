import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeTotalQuestionListSelectEntity with JsonConvert<HomeTotalQuestionListSelectEntity> {
	@JSONField(name: "list")
	List<HomeTotalQuestionListSelectList> xList;
}

class HomeTotalQuestionListSelectList with JsonConvert<HomeTotalQuestionListSelectList> {
	@JSONField(name: "SheetCode")
	String sheetCode;
	@JSONField(name: "Caption")
	String caption;
	@JSONField(name: "Count")
	int count;
}
