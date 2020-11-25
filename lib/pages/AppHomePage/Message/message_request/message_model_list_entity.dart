import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class MessageModelListEntity with JsonConvert<MessageModelListEntity> {
	@JSONField(name: "list")
	List<MessageModelListList> xList;
}

class MessageModelListList with JsonConvert<MessageModelListList> {
	@JSONField(name: "MessageID")
	int messageID;
	@JSONField(name: "LinkID")
	String linkID;
	@JSONField(name: "LinkType")
	int linkType;
	@JSONField(name: "ST_See")
	int stSee;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Content")
	String content;
	@JSONField(name: "Icon")
	String icon;
	String senderObjName;
	@JSONField(name: "BeginTime")
	String beginTime;
}
