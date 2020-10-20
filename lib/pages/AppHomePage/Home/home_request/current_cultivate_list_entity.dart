import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class CurrentCultivateListEntity with JsonConvert<CurrentCultivateListEntity> {
	@JSONField(name: "list")
	List<CurrentCultivateListList> xList;
}

class CurrentCultivateListList with JsonConvert<CurrentCultivateListList> {
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Type")
	int type;
	@JSONField(name: "Trainer")
	String trainer;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "Address")
	String address;
	@JSONField(name: "PersonNumber")
	int personNumber;
	@JSONField(name: "ID")
	int iD;
}
