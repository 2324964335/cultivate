import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class HomePageDataEntity with JsonConvert<HomePageDataEntity> {
	@JSONField(name: "list")
	List<HomePageDataList> xList;
}

class HomePageDataList with JsonConvert<HomePageDataList> {
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "ST_See")
	int st_see;
	@JSONField(name: "LinkID")
	String linkID;
	@JSONField(name: "BroadID")
	String broadID;
	@JSONField(name: "Type")
	int type;
	@JSONField(name: "ReadType")
	int readType;
	@JSONField(name: "LinkType")
	int linkType;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "Trainer")
	String trainer;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "TeachType")
	String teachType;
	@JSONField(name: "senderObjName")
	String senderObjName;
	@JSONField(name: "LikeCount")
	int likeCount;
	@JSONField(name: "CommentCount")
	int commentCount;
	@JSONField(name: "SeeCount")
	int seeCount;
	@JSONField(name: "ViewCount")
	int viewCount;
}
