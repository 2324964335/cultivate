import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class MyCultivateDetailBottomPersonListEntity with JsonConvert<MyCultivateDetailBottomPersonListEntity> {
	@JSONField(name: "list")
	List<MyCultivateDetailBottomPersonListList> xList;
}

class MyCultivateDetailBottomPersonListList with JsonConvert<MyCultivateDetailBottomPersonListList> {
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "TS_Signin")
	String tsSignin;
	@JSONField(name: "ID")
	int iD;
}
