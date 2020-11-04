import 'package:cultivate/pages/AppHomePage/Home/home_request/home_total_operation_examine_list_model_entity.dart';

homeTotalOperationExamineListModelEntityFromJson(HomeTotalOperationExamineListModelEntity data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<HomeTotalOperationExamineListModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeTotalOperationExamineListModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeTotalOperationExamineListModelEntityToJson(HomeTotalOperationExamineListModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeTotalOperationExamineListModelListFromJson(HomeTotalOperationExamineListModelList data, Map<String, dynamic> json) {
	if (json['SheetCode'] != null) {
		data.sheetCode = json['SheetCode']?.toString();
	}
	if (json['ItemCode'] != null) {
		data.itemCode = json['ItemCode']?.toString();
	}
	if (json['Caption'] != null) {
		data.caption = json['Caption']?.toString();
	}
	if (json['item'] != null) {
		data.item = new List<HomeTotalOperationExamineListModelListItem>();
		(json['item'] as List).forEach((v) {
			data.item.add(new HomeTotalOperationExamineListModelListItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeTotalOperationExamineListModelListToJson(HomeTotalOperationExamineListModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SheetCode'] = entity.sheetCode;
	data['ItemCode'] = entity.itemCode;
	data['Caption'] = entity.caption;
	if (entity.item != null) {
		data['item'] =  entity.item.map((v) => v.toJson()).toList();
	}
	return data;
}

homeTotalOperationExamineListModelListItemFromJson(HomeTotalOperationExamineListModelListItem data, Map<String, dynamic> json) {
	if (json['OptionOrd'] != null) {
		data.optionOrd = json['OptionOrd']?.toString();
	}
	if (json['OptionText'] != null) {
		data.optionText = json['OptionText']?.toString();
	}
	if (json['WeightedValue'] != null) {
		data.weightedValue = json['WeightedValue']?.toDouble();
	}
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeTotalOperationExamineListModelListItemToJson(HomeTotalOperationExamineListModelListItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['OptionOrd'] = entity.optionOrd;
	data['OptionText'] = entity.optionText;
	data['WeightedValue'] = entity.weightedValue;
	data['ID'] = entity.iD;
	return data;
}