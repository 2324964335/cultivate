import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeTotalOperationExamineListModelEntity with JsonConvert<HomeTotalOperationExamineListModelEntity> {
	@JSONField(name: "list")
	List<HomeTotalOperationExamineListModelList> xList;
}

class HomeTotalOperationExamineListModelList with JsonConvert<HomeTotalOperationExamineListModelList> {
	@JSONField(name: "SheetCode")
	String sheetCode;
	@JSONField(name: "ItemCode")
	String itemCode;
	@JSONField(name: "Caption")
	String caption;
	List<HomeTotalOperationExamineListModelListItem> item;
}

class HomeTotalOperationExamineListModelListItem with JsonConvert<HomeTotalOperationExamineListModelListItem> {
	@JSONField(name: "OptionOrd")
	String optionOrd;
	@JSONField(name: "OptionText")
	String optionText;
	@JSONField(name: "WeightedValue")
	double weightedValue;
	@JSONField(name: "ID")
	int iD;
}
