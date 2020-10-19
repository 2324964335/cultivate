import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomePageTopTotalDataEntity with JsonConvert<HomePageTopTotalDataEntity> {
	int success;
	String msg;
	int code;
	List<HomePageTopTotalDataData> data;
}

class HomePageTopTotalDataData with JsonConvert<HomePageTopTotalDataData> {
	@JSONField(name: "list")
	List<HomePageTopTotalDataDataList> xList;
}

class HomePageTopTotalDataDataList with JsonConvert<HomePageTopTotalDataDataList> {
	@JSONField(name: "Key")
	int key;
	@JSONField(name: "Value")
	String value;
}
