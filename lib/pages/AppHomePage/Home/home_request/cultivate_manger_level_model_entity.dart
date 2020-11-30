import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class CultivateMangerLevelModelEntity with JsonConvert<CultivateMangerLevelModelEntity> {
	int success;
	String msg;
	int code;
	List<CultivateMangerLevelModelData> data;
}

class CultivateMangerLevelModelData with JsonConvert<CultivateMangerLevelModelData> {
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Name")
	String name;
}
