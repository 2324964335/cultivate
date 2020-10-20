// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:cultivate/pages/AppHomePage/Home/home_request/cultivate_deatil_entity.dart';
import 'package:cultivate/generated/json/cultivate_deatil_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_total_data_entity.dart';
import 'package:cultivate/generated/json/home_page_top_total_data_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/current_month_examine_list_entity.dart';
import 'package:cultivate/generated/json/current_month_examine_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/my_cultivate_detail_bottom_person_list_entity.dart';
import 'package:cultivate/generated/json/my_cultivate_detail_bottom_person_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/current_cultivate_list_entity.dart';
import 'package:cultivate/generated/json/current_cultivate_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_data_entity.dart';
import 'package:cultivate/generated/json/home_page_data_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_month_entity.dart';
import 'package:cultivate/generated/json/home_page_top_month_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/my_cultivate_detail_top_total_entity.dart';
import 'package:cultivate/generated/json/my_cultivate_detail_top_total_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case CultivateDeatilEntity:
			return cultivateDeatilEntityFromJson(data as CultivateDeatilEntity, json) as T;			case HomePageTopTotalDataEntity:
			return homePageTopTotalDataEntityFromJson(data as HomePageTopTotalDataEntity, json) as T;			case HomePageTopTotalDataData:
			return homePageTopTotalDataDataFromJson(data as HomePageTopTotalDataData, json) as T;			case HomePageTopTotalDataDataList:
			return homePageTopTotalDataDataListFromJson(data as HomePageTopTotalDataDataList, json) as T;			case CurrentMonthExamineListEntity:
			return currentMonthExamineListEntityFromJson(data as CurrentMonthExamineListEntity, json) as T;			case CurrentMonthExamineListList:
			return currentMonthExamineListListFromJson(data as CurrentMonthExamineListList, json) as T;			case MyCultivateDetailBottomPersonListEntity:
			return myCultivateDetailBottomPersonListEntityFromJson(data as MyCultivateDetailBottomPersonListEntity, json) as T;			case MyCultivateDetailBottomPersonListList:
			return myCultivateDetailBottomPersonListListFromJson(data as MyCultivateDetailBottomPersonListList, json) as T;			case CurrentCultivateListEntity:
			return currentCultivateListEntityFromJson(data as CurrentCultivateListEntity, json) as T;			case CurrentCultivateListList:
			return currentCultivateListListFromJson(data as CurrentCultivateListList, json) as T;			case HomePageDataEntity:
			return homePageDataEntityFromJson(data as HomePageDataEntity, json) as T;			case HomePageDataList:
			return homePageDataListFromJson(data as HomePageDataList, json) as T;			case HomePageTopMonthEntity:
			return homePageTopMonthEntityFromJson(data as HomePageTopMonthEntity, json) as T;			case HomePageTopMonthList:
			return homePageTopMonthListFromJson(data as HomePageTopMonthList, json) as T;			case MyCultivateDetailTopTotalEntity:
			return myCultivateDetailTopTotalEntityFromJson(data as MyCultivateDetailTopTotalEntity, json) as T;			case MyCultivateDetailTopTotalList:
			return myCultivateDetailTopTotalListFromJson(data as MyCultivateDetailTopTotalList, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case CultivateDeatilEntity:
			return cultivateDeatilEntityToJson(data as CultivateDeatilEntity);			case HomePageTopTotalDataEntity:
			return homePageTopTotalDataEntityToJson(data as HomePageTopTotalDataEntity);			case HomePageTopTotalDataData:
			return homePageTopTotalDataDataToJson(data as HomePageTopTotalDataData);			case HomePageTopTotalDataDataList:
			return homePageTopTotalDataDataListToJson(data as HomePageTopTotalDataDataList);			case CurrentMonthExamineListEntity:
			return currentMonthExamineListEntityToJson(data as CurrentMonthExamineListEntity);			case CurrentMonthExamineListList:
			return currentMonthExamineListListToJson(data as CurrentMonthExamineListList);			case MyCultivateDetailBottomPersonListEntity:
			return myCultivateDetailBottomPersonListEntityToJson(data as MyCultivateDetailBottomPersonListEntity);			case MyCultivateDetailBottomPersonListList:
			return myCultivateDetailBottomPersonListListToJson(data as MyCultivateDetailBottomPersonListList);			case CurrentCultivateListEntity:
			return currentCultivateListEntityToJson(data as CurrentCultivateListEntity);			case CurrentCultivateListList:
			return currentCultivateListListToJson(data as CurrentCultivateListList);			case HomePageDataEntity:
			return homePageDataEntityToJson(data as HomePageDataEntity);			case HomePageDataList:
			return homePageDataListToJson(data as HomePageDataList);			case HomePageTopMonthEntity:
			return homePageTopMonthEntityToJson(data as HomePageTopMonthEntity);			case HomePageTopMonthList:
			return homePageTopMonthListToJson(data as HomePageTopMonthList);			case MyCultivateDetailTopTotalEntity:
			return myCultivateDetailTopTotalEntityToJson(data as MyCultivateDetailTopTotalEntity);			case MyCultivateDetailTopTotalList:
			return myCultivateDetailTopTotalListToJson(data as MyCultivateDetailTopTotalList);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'CultivateDeatilEntity':
			return CultivateDeatilEntity().fromJson(json);			case 'HomePageTopTotalDataEntity':
			return HomePageTopTotalDataEntity().fromJson(json);			case 'HomePageTopTotalDataData':
			return HomePageTopTotalDataData().fromJson(json);			case 'HomePageTopTotalDataDataList':
			return HomePageTopTotalDataDataList().fromJson(json);			case 'CurrentMonthExamineListEntity':
			return CurrentMonthExamineListEntity().fromJson(json);			case 'CurrentMonthExamineListList':
			return CurrentMonthExamineListList().fromJson(json);			case 'MyCultivateDetailBottomPersonListEntity':
			return MyCultivateDetailBottomPersonListEntity().fromJson(json);			case 'MyCultivateDetailBottomPersonListList':
			return MyCultivateDetailBottomPersonListList().fromJson(json);			case 'CurrentCultivateListEntity':
			return CurrentCultivateListEntity().fromJson(json);			case 'CurrentCultivateListList':
			return CurrentCultivateListList().fromJson(json);			case 'HomePageDataEntity':
			return HomePageDataEntity().fromJson(json);			case 'HomePageDataList':
			return HomePageDataList().fromJson(json);			case 'HomePageTopMonthEntity':
			return HomePageTopMonthEntity().fromJson(json);			case 'HomePageTopMonthList':
			return HomePageTopMonthList().fromJson(json);			case 'MyCultivateDetailTopTotalEntity':
			return MyCultivateDetailTopTotalEntity().fromJson(json);			case 'MyCultivateDetailTopTotalList':
			return MyCultivateDetailTopTotalList().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'CultivateDeatilEntity':
			return List<CultivateDeatilEntity>();			case 'HomePageTopTotalDataEntity':
			return List<HomePageTopTotalDataEntity>();			case 'HomePageTopTotalDataData':
			return List<HomePageTopTotalDataData>();			case 'HomePageTopTotalDataDataList':
			return List<HomePageTopTotalDataDataList>();			case 'CurrentMonthExamineListEntity':
			return List<CurrentMonthExamineListEntity>();			case 'CurrentMonthExamineListList':
			return List<CurrentMonthExamineListList>();			case 'MyCultivateDetailBottomPersonListEntity':
			return List<MyCultivateDetailBottomPersonListEntity>();			case 'MyCultivateDetailBottomPersonListList':
			return List<MyCultivateDetailBottomPersonListList>();			case 'CurrentCultivateListEntity':
			return List<CurrentCultivateListEntity>();			case 'CurrentCultivateListList':
			return List<CurrentCultivateListList>();			case 'HomePageDataEntity':
			return List<HomePageDataEntity>();			case 'HomePageDataList':
			return List<HomePageDataList>();			case 'HomePageTopMonthEntity':
			return List<HomePageTopMonthEntity>();			case 'HomePageTopMonthList':
			return List<HomePageTopMonthList>();			case 'MyCultivateDetailTopTotalEntity':
			return List<MyCultivateDetailTopTotalEntity>();			case 'MyCultivateDetailTopTotalList':
			return List<MyCultivateDetailTopTotalList>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}