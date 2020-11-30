import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class CultivateMangerNengDataListEntity with JsonConvert<CultivateMangerNengDataListEntity> {
	int success;
	String msg;
	int code;
	List<CultivateMangerNengDataListData> data;
}

class CultivateMangerNengDataListData with JsonConvert<CultivateMangerNengDataListData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "TeachType")
	int teachType;
	@JSONField(name: "ClassType")
	int classType;
	@JSONField(name: "BizTime")
	String bizTime;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "OP_Regist")
	String opRegist;
	@JSONField(name: "Icon")
	String icon;
}
