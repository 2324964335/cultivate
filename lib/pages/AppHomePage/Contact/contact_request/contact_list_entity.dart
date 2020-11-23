import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'package:cultivate/generated/json/base/json_field.dart';

class ContactListEntity with JsonConvert<ContactListEntity> {
	int success;
	String msg;
	int code;
	List<ContactListData> data;
}

class ContactListData with JsonConvert<ContactListData> {
	@JSONField(name: "HosName")
	String hosName;
	@JSONField(name: "list")
	List<ContactListDataList> xList;
}

class ContactListDataList with JsonConvert<ContactListDataList> {
	@JSONField(name: "WardCode")
	String wardCode;
	@JSONField(name: "WardName")
	String wardName;
	@JSONField(name: "EmpCount")
	int empCount;
	@JSONField(name: "EmpInfo")
	List<ContactListDataListEmpInfo> empInfo;
}

class ContactListDataListEmpInfo with JsonConvert<ContactListDataListEmpInfo> {
	@JSONField(name: "EmpList")
	List<ContactListDataListEmpInfoItem> empList;
}

class ContactListDataListEmpInfoItem with JsonConvert<ContactListDataListEmpInfoItem> {
	@JSONField(name: "Icon")
	String icon;
	@JSONField(name: "WorkNo")
	String workNo;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Tell")
	String tell;
	@JSONField(name: "WardName")
	String wardName;
}