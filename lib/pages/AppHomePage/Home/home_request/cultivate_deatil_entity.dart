import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class CultivateDeatilEntity with JsonConvert<CultivateDeatilEntity> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Banner")
	String banner;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Trainer")
	String trainer;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "EndTime")
	String endTime;
	@JSONField(name: "Address")
	String address;
	@JSONField(name: "TrainingObjects")
	String trainingObjects;
	@JSONField(name: "JoinCount")
	int joinCount;
	@JSONField(name: "PersonCount")
	int personCount;
	@JSONField(name: "OP_Regist")
	String oP_Regist;
	@JSONField(name: "ReleaseTime")
	String releaseTime;
}
