import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomeUnreadInformationModelEntity with JsonConvert<HomeUnreadInformationModelEntity> {
	@JSONField(name: "list")
	List<HomeUnreadInformationModelList> xList;
}

class HomeUnreadInformationModelList with JsonConvert<HomeUnreadInformationModelList> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "Trianer")
	String trianer;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "Content")
	String content;
	@JSONField(name: "Likes")
	int likes;
	@JSONField(name: "Comments")
	int comments;
	@JSONField(name: "SeeCount")
	int seeCount;
}
