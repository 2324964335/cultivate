import 'package:cultivate/pages/AppHomePage/Contact/contact_request/contact_list_entity.dart';

contactListEntityFromJson(ContactListEntity data, Map<String, dynamic> json) {
	if (json['success'] != null) {
		data.success = json['success']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<ContactListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ContactListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> contactListEntityToJson(ContactListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

contactListDataFromJson(ContactListData data, Map<String, dynamic> json) {
	if (json['HosName'] != null) {
		data.hosName = json['HosName']?.toString();
	}
	if (json['list'] != null) {
		data.xList = new List<ContactListDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new ContactListDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> contactListDataToJson(ContactListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['HosName'] = entity.hosName;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

contactListDataListFromJson(ContactListDataList data, Map<String, dynamic> json) {
	if (json['WardCode'] != null) {
		data.wardCode = json['WardCode']?.toString();
	}
	if (json['WardName'] != null) {
		data.wardName = json['WardName']?.toString();
	}
	if (json['EmpCount'] != null) {
		data.empCount = json['EmpCount']?.toInt();
	}
	if (json['EmpInfo'] != null) {
		data.empInfo = new List<ContactListDataListEmpInfo>();
		(json['EmpInfo'] as List).forEach((v) {
			data.empInfo.add(new ContactListDataListEmpInfo().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> contactListDataListToJson(ContactListDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['WardCode'] = entity.wardCode;
	data['WardName'] = entity.wardName;
	data['EmpCount'] = entity.empCount;
	if (entity.empInfo != null) {
		data['EmpInfo'] =  entity.empInfo.map((v) => v.toJson()).toList();
	}
	return data;
}

contactListDataListEmpInfoFromJson(ContactListDataListEmpInfo data, Map<String, dynamic> json) {
	if (json['EmpList'] != null) {
		data.empList = new List<ContactListDataListEmpInfoItem>();
		(json['EmpList'] as List).forEach((v) {
			data.empList.add(new ContactListDataListEmpInfoItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> contactListDataListEmpInfoToJson(ContactListDataListEmpInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.empList != null) {
		data['EmpList'] =  entity.empList.map((v) => v.toJson()).toList();
	}
	return data;
}

contactListDataListEmpInfoItemFromJson(ContactListDataListEmpInfoItem data, Map<String, dynamic> json) {
	if (json['Icon'] != null) {
		data.icon = json['Icon']?.toString();
	}
	if (json['WorkNo'] != null) {
		data.workNo = json['WorkNo']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Tell'] != null) {
		data.tell = json['Tell']?.toString();
	}
	return data;
}

Map<String, dynamic> contactListDataListEmpInfoItemToJson(ContactListDataListEmpInfoItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Icon'] = entity.icon;
	data['WorkNo'] = entity.workNo;
	data['Name'] = entity.name;
	data['Tell'] = entity.tell;
	return data;
}