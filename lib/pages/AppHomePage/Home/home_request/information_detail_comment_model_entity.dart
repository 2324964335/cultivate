import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class InformationDetailCommentModelEntity with JsonConvert<InformationDetailCommentModelEntity> {
	int success;
	String msg;
	int code;
	InformationDetailCommentModelData data;
}

class InformationDetailCommentModelData with JsonConvert<InformationDetailCommentModelData> {
	@JSONField(name: "list")
	List<InformationDetailCommantModelDataList> xList;
}

class InformationDetailCommantModelDataList with JsonConvert<InformationDetailCommantModelDataList> {
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "TS_Comment")
	String tsComment;
	@JSONField(name: "Comment")
	String comment;
}
