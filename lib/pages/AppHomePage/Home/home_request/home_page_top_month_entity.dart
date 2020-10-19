import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomePageTopMonthEntity with JsonConvert<HomePageTopMonthEntity> {
	@JSONField(name: "list")
	List<HomePageTopMonthList> xList;
}

class HomePageTopMonthList with JsonConvert<HomePageTopMonthList> {
	String value;
	String key;
}
