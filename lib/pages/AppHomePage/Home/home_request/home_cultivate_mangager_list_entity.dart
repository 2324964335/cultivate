import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeCultivateMangagerListEntity with JsonConvert<HomeCultivateMangagerListEntity> {
	@JSONField(name: "list")
	List<HomeCultivateMangagerListList> xList;
}

class HomeCultivateMangagerListList with JsonConvert<HomeCultivateMangagerListList> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "SignInTime")
	String signInTime;
	@JSONField(name: "OP_Regist")
	String opRegist;
	@JSONField(name: "TS_Regist")
	String tsRegist;
	@JSONField(name: "Category")
	String category;
	@JSONField(name: "Status")
	String status;
	@JSONField(name: "BeginTime")
	String beginTime;
}
