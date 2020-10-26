import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class InformationDetailCommentModelEntity with JsonConvert<InformationDetailCommentModelEntity> {
	int success;
	String msg;
	int code;
	InformationDetailCommentModelData data;
}

class InformationDetailCommentModelData with JsonConvert<InformationDetailCommentModelData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "Status")
	int status;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "OP_Regist")
	String opRegist;
	@JSONField(name: "TS_Regist")
	String tsRegist;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Content")
	String content;
	@JSONField(name: "BeginTime")
	String beginTime;
	@JSONField(name: "Endtime")
	String endtime;
	@JSONField(name: "Trainer")
	String trainer;
	@JSONField(name: "MembersEndTime")
	String membersEndTime;
	@JSONField(name: "SignInTime")
	String signInTime;
	@JSONField(name: "Trainee_Score")
	String traineeScore;
	@JSONField(name: "PersonCount")
	int personCount;
	@JSONField(name: "PersonMax")
	int personMax;
	@JSONField(name: "Likes")
	int likes;
	@JSONField(name: "SeeCount")
	int seeCount;
	@JSONField(name: "Comments")
	int comments;
	@JSONField(name: "list")
	List<InformationDetailCommantModelDataList> xList;
}

class InformationDetailCommantModelDataList with JsonConvert<InformationDetailCommantModelDataList> {
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "TS_Comment")
	String tsComment;
	@JSONField(name: "Comment")
	String comment;
}
