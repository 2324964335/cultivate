import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class MyCultivateDetailTopTotalEntity with JsonConvert<MyCultivateDetailTopTotalEntity> {
	@JSONField(name: "list")
	List<MyCultivateDetailTopTotalList> xList;
}

class MyCultivateDetailTopTotalList with JsonConvert<MyCultivateDetailTopTotalList> {
	@JSONField(name: "Key")
	int key;
	@JSONField(name: "Value")
	String value;
}
