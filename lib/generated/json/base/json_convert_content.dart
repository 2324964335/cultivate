// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_cultivate_mangager_list_entity.dart';
import 'package:cultivate/generated/json/home_cultivate_mangager_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_classroom_data_video_entity.dart';
import 'package:cultivate/generated/json/home_classroom_data_video_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/cultivate_deatil_entity.dart';
import 'package:cultivate/generated/json/cultivate_deatil_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_total_data_entity.dart';
import 'package:cultivate/generated/json/home_page_top_total_data_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_classroom_data_entity.dart';
import 'package:cultivate/generated/json/home_classroom_data_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_total_question_list_select_entity.dart';
import 'package:cultivate/generated/json/home_total_question_list_select_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_examine_person_list_model_entity.dart';
import 'package:cultivate/generated/json/home_examine_person_list_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Examine/home_question_model_entity.dart';
import 'package:cultivate/generated/json/home_question_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/current_month_examine_list_entity.dart';
import 'package:cultivate/generated/json/current_month_examine_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/information_detail_comment_model_entity.dart';
import 'package:cultivate/generated/json/information_detail_comment_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_total_operation_examine_list_model_entity.dart';
import 'package:cultivate/generated/json/home_total_operation_examine_list_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_video_learn_bottom_model_entity.dart';
import 'package:cultivate/generated/json/home_video_learn_bottom_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/my_cultivate_detail_bottom_person_list_entity.dart';
import 'package:cultivate/generated/json/my_cultivate_detail_bottom_person_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/current_cultivate_list_entity.dart';
import 'package:cultivate/generated/json/current_cultivate_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_data_entity.dart';
import 'package:cultivate/generated/json/home_page_data_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_unread_information_model_entity.dart';
import 'package:cultivate/generated/json/home_unread_information_model_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_examine_manager_list_entity.dart';
import 'package:cultivate/generated/json/home_examine_manager_list_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_page_top_month_entity.dart';
import 'package:cultivate/generated/json/home_page_top_month_entity_helper.dart';
import 'package:cultivate/pages/AppHomePage/Home/home_request/home_unread_information_detail_model_entity.dart';
import 'package:cultivate/generated/json/home_unread_information_detail_model_entity_helper.dart';
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
    switch (type) {			case HomeCultivateMangagerListEntity:
			return homeCultivateMangagerListEntityFromJson(data as HomeCultivateMangagerListEntity, json) as T;			case HomeCultivateMangagerListList:
			return homeCultivateMangagerListListFromJson(data as HomeCultivateMangagerListList, json) as T;			case HomeClassroomDataVideoEntity:
			return homeClassroomDataVideoEntityFromJson(data as HomeClassroomDataVideoEntity, json) as T;			case HomeClassroomDataVideoData:
			return homeClassroomDataVideoDataFromJson(data as HomeClassroomDataVideoData, json) as T;			case CultivateDeatilEntity:
			return cultivateDeatilEntityFromJson(data as CultivateDeatilEntity, json) as T;			case HomePageTopTotalDataEntity:
			return homePageTopTotalDataEntityFromJson(data as HomePageTopTotalDataEntity, json) as T;			case HomePageTopTotalDataData:
			return homePageTopTotalDataDataFromJson(data as HomePageTopTotalDataData, json) as T;			case HomePageTopTotalDataDataList:
			return homePageTopTotalDataDataListFromJson(data as HomePageTopTotalDataDataList, json) as T;			case HomeClassroomDataEntity:
			return homeClassroomDataEntityFromJson(data as HomeClassroomDataEntity, json) as T;			case HomeClassroomDataData:
			return homeClassroomDataDataFromJson(data as HomeClassroomDataData, json) as T;			case HomeTotalQuestionListSelectEntity:
			return homeTotalQuestionListSelectEntityFromJson(data as HomeTotalQuestionListSelectEntity, json) as T;			case HomeTotalQuestionListSelectList:
			return homeTotalQuestionListSelectListFromJson(data as HomeTotalQuestionListSelectList, json) as T;			case HomeExaminePersonListModelEntity:
			return homeExaminePersonListModelEntityFromJson(data as HomeExaminePersonListModelEntity, json) as T;			case HomeExaminePersonListModelList:
			return homeExaminePersonListModelListFromJson(data as HomeExaminePersonListModelList, json) as T;			case HomeQuestionModelEntity:
			return homeQuestionModelEntityFromJson(data as HomeQuestionModelEntity, json) as T;			case HomeQuestionModelList:
			return homeQuestionModelListFromJson(data as HomeQuestionModelList, json) as T;			case CurrentMonthExamineListEntity:
			return currentMonthExamineListEntityFromJson(data as CurrentMonthExamineListEntity, json) as T;			case CurrentMonthExamineListList:
			return currentMonthExamineListListFromJson(data as CurrentMonthExamineListList, json) as T;			case InformationDetailCommentModelEntity:
			return informationDetailCommentModelEntityFromJson(data as InformationDetailCommentModelEntity, json) as T;			case InformationDetailCommentModelData:
			return informationDetailCommentModelDataFromJson(data as InformationDetailCommentModelData, json) as T;			case InformationDetailCommantModelDataList:
			return informationDetailCommantModelDataListFromJson(data as InformationDetailCommantModelDataList, json) as T;			case HomeTotalOperationExamineListModelEntity:
			return homeTotalOperationExamineListModelEntityFromJson(data as HomeTotalOperationExamineListModelEntity, json) as T;			case HomeTotalOperationExamineListModelList:
			return homeTotalOperationExamineListModelListFromJson(data as HomeTotalOperationExamineListModelList, json) as T;			case HomeTotalOperationExamineListModelListItem:
			return homeTotalOperationExamineListModelListItemFromJson(data as HomeTotalOperationExamineListModelListItem, json) as T;			case HomeVideoLearnBottomModelEntity:
			return homeVideoLearnBottomModelEntityFromJson(data as HomeVideoLearnBottomModelEntity, json) as T;			case HomeVideoLearnBottomModelData:
			return homeVideoLearnBottomModelDataFromJson(data as HomeVideoLearnBottomModelData, json) as T;			case MyCultivateDetailBottomPersonListEntity:
			return myCultivateDetailBottomPersonListEntityFromJson(data as MyCultivateDetailBottomPersonListEntity, json) as T;			case MyCultivateDetailBottomPersonListList:
			return myCultivateDetailBottomPersonListListFromJson(data as MyCultivateDetailBottomPersonListList, json) as T;			case CurrentCultivateListEntity:
			return currentCultivateListEntityFromJson(data as CurrentCultivateListEntity, json) as T;			case CurrentCultivateListList:
			return currentCultivateListListFromJson(data as CurrentCultivateListList, json) as T;			case HomePageDataEntity:
			return homePageDataEntityFromJson(data as HomePageDataEntity, json) as T;			case HomePageDataList:
			return homePageDataListFromJson(data as HomePageDataList, json) as T;			case HomeUnreadInformationModelEntity:
			return homeUnreadInformationModelEntityFromJson(data as HomeUnreadInformationModelEntity, json) as T;			case HomeUnreadInformationModelList:
			return homeUnreadInformationModelListFromJson(data as HomeUnreadInformationModelList, json) as T;			case HomeExamineManagerListEntity:
			return homeExamineManagerListEntityFromJson(data as HomeExamineManagerListEntity, json) as T;			case HomeExamineManagerListList:
			return homeExamineManagerListListFromJson(data as HomeExamineManagerListList, json) as T;			case HomePageTopMonthEntity:
			return homePageTopMonthEntityFromJson(data as HomePageTopMonthEntity, json) as T;			case HomePageTopMonthList:
			return homePageTopMonthListFromJson(data as HomePageTopMonthList, json) as T;			case HomeUnreadInformationDetailModelEntity:
			return homeUnreadInformationDetailModelEntityFromJson(data as HomeUnreadInformationDetailModelEntity, json) as T;			case MyCultivateDetailTopTotalEntity:
			return myCultivateDetailTopTotalEntityFromJson(data as MyCultivateDetailTopTotalEntity, json) as T;			case MyCultivateDetailTopTotalList:
			return myCultivateDetailTopTotalListFromJson(data as MyCultivateDetailTopTotalList, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case HomeCultivateMangagerListEntity:
			return homeCultivateMangagerListEntityToJson(data as HomeCultivateMangagerListEntity);			case HomeCultivateMangagerListList:
			return homeCultivateMangagerListListToJson(data as HomeCultivateMangagerListList);			case HomeClassroomDataVideoEntity:
			return homeClassroomDataVideoEntityToJson(data as HomeClassroomDataVideoEntity);			case HomeClassroomDataVideoData:
			return homeClassroomDataVideoDataToJson(data as HomeClassroomDataVideoData);			case CultivateDeatilEntity:
			return cultivateDeatilEntityToJson(data as CultivateDeatilEntity);			case HomePageTopTotalDataEntity:
			return homePageTopTotalDataEntityToJson(data as HomePageTopTotalDataEntity);			case HomePageTopTotalDataData:
			return homePageTopTotalDataDataToJson(data as HomePageTopTotalDataData);			case HomePageTopTotalDataDataList:
			return homePageTopTotalDataDataListToJson(data as HomePageTopTotalDataDataList);			case HomeClassroomDataEntity:
			return homeClassroomDataEntityToJson(data as HomeClassroomDataEntity);			case HomeClassroomDataData:
			return homeClassroomDataDataToJson(data as HomeClassroomDataData);			case HomeTotalQuestionListSelectEntity:
			return homeTotalQuestionListSelectEntityToJson(data as HomeTotalQuestionListSelectEntity);			case HomeTotalQuestionListSelectList:
			return homeTotalQuestionListSelectListToJson(data as HomeTotalQuestionListSelectList);			case HomeExaminePersonListModelEntity:
			return homeExaminePersonListModelEntityToJson(data as HomeExaminePersonListModelEntity);			case HomeExaminePersonListModelList:
			return homeExaminePersonListModelListToJson(data as HomeExaminePersonListModelList);			case HomeQuestionModelEntity:
			return homeQuestionModelEntityToJson(data as HomeQuestionModelEntity);			case HomeQuestionModelList:
			return homeQuestionModelListToJson(data as HomeQuestionModelList);			case CurrentMonthExamineListEntity:
			return currentMonthExamineListEntityToJson(data as CurrentMonthExamineListEntity);			case CurrentMonthExamineListList:
			return currentMonthExamineListListToJson(data as CurrentMonthExamineListList);			case InformationDetailCommentModelEntity:
			return informationDetailCommentModelEntityToJson(data as InformationDetailCommentModelEntity);			case InformationDetailCommentModelData:
			return informationDetailCommentModelDataToJson(data as InformationDetailCommentModelData);			case InformationDetailCommantModelDataList:
			return informationDetailCommantModelDataListToJson(data as InformationDetailCommantModelDataList);			case HomeTotalOperationExamineListModelEntity:
			return homeTotalOperationExamineListModelEntityToJson(data as HomeTotalOperationExamineListModelEntity);			case HomeTotalOperationExamineListModelList:
			return homeTotalOperationExamineListModelListToJson(data as HomeTotalOperationExamineListModelList);			case HomeTotalOperationExamineListModelListItem:
			return homeTotalOperationExamineListModelListItemToJson(data as HomeTotalOperationExamineListModelListItem);			case HomeVideoLearnBottomModelEntity:
			return homeVideoLearnBottomModelEntityToJson(data as HomeVideoLearnBottomModelEntity);			case HomeVideoLearnBottomModelData:
			return homeVideoLearnBottomModelDataToJson(data as HomeVideoLearnBottomModelData);			case MyCultivateDetailBottomPersonListEntity:
			return myCultivateDetailBottomPersonListEntityToJson(data as MyCultivateDetailBottomPersonListEntity);			case MyCultivateDetailBottomPersonListList:
			return myCultivateDetailBottomPersonListListToJson(data as MyCultivateDetailBottomPersonListList);			case CurrentCultivateListEntity:
			return currentCultivateListEntityToJson(data as CurrentCultivateListEntity);			case CurrentCultivateListList:
			return currentCultivateListListToJson(data as CurrentCultivateListList);			case HomePageDataEntity:
			return homePageDataEntityToJson(data as HomePageDataEntity);			case HomePageDataList:
			return homePageDataListToJson(data as HomePageDataList);			case HomeUnreadInformationModelEntity:
			return homeUnreadInformationModelEntityToJson(data as HomeUnreadInformationModelEntity);			case HomeUnreadInformationModelList:
			return homeUnreadInformationModelListToJson(data as HomeUnreadInformationModelList);			case HomeExamineManagerListEntity:
			return homeExamineManagerListEntityToJson(data as HomeExamineManagerListEntity);			case HomeExamineManagerListList:
			return homeExamineManagerListListToJson(data as HomeExamineManagerListList);			case HomePageTopMonthEntity:
			return homePageTopMonthEntityToJson(data as HomePageTopMonthEntity);			case HomePageTopMonthList:
			return homePageTopMonthListToJson(data as HomePageTopMonthList);			case HomeUnreadInformationDetailModelEntity:
			return homeUnreadInformationDetailModelEntityToJson(data as HomeUnreadInformationDetailModelEntity);			case MyCultivateDetailTopTotalEntity:
			return myCultivateDetailTopTotalEntityToJson(data as MyCultivateDetailTopTotalEntity);			case MyCultivateDetailTopTotalList:
			return myCultivateDetailTopTotalListToJson(data as MyCultivateDetailTopTotalList);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'HomeCultivateMangagerListEntity':
			return HomeCultivateMangagerListEntity().fromJson(json);			case 'HomeCultivateMangagerListList':
			return HomeCultivateMangagerListList().fromJson(json);			case 'HomeClassroomDataVideoEntity':
			return HomeClassroomDataVideoEntity().fromJson(json);			case 'HomeClassroomDataVideoData':
			return HomeClassroomDataVideoData().fromJson(json);			case 'CultivateDeatilEntity':
			return CultivateDeatilEntity().fromJson(json);			case 'HomePageTopTotalDataEntity':
			return HomePageTopTotalDataEntity().fromJson(json);			case 'HomePageTopTotalDataData':
			return HomePageTopTotalDataData().fromJson(json);			case 'HomePageTopTotalDataDataList':
			return HomePageTopTotalDataDataList().fromJson(json);			case 'HomeClassroomDataEntity':
			return HomeClassroomDataEntity().fromJson(json);			case 'HomeClassroomDataData':
			return HomeClassroomDataData().fromJson(json);			case 'HomeTotalQuestionListSelectEntity':
			return HomeTotalQuestionListSelectEntity().fromJson(json);			case 'HomeTotalQuestionListSelectList':
			return HomeTotalQuestionListSelectList().fromJson(json);			case 'HomeExaminePersonListModelEntity':
			return HomeExaminePersonListModelEntity().fromJson(json);			case 'HomeExaminePersonListModelList':
			return HomeExaminePersonListModelList().fromJson(json);			case 'HomeQuestionModelEntity':
			return HomeQuestionModelEntity().fromJson(json);			case 'HomeQuestionModelList':
			return HomeQuestionModelList().fromJson(json);			case 'CurrentMonthExamineListEntity':
			return CurrentMonthExamineListEntity().fromJson(json);			case 'CurrentMonthExamineListList':
			return CurrentMonthExamineListList().fromJson(json);			case 'InformationDetailCommentModelEntity':
			return InformationDetailCommentModelEntity().fromJson(json);			case 'InformationDetailCommentModelData':
			return InformationDetailCommentModelData().fromJson(json);			case 'InformationDetailCommantModelDataList':
			return InformationDetailCommantModelDataList().fromJson(json);			case 'HomeTotalOperationExamineListModelEntity':
			return HomeTotalOperationExamineListModelEntity().fromJson(json);			case 'HomeTotalOperationExamineListModelList':
			return HomeTotalOperationExamineListModelList().fromJson(json);			case 'HomeTotalOperationExamineListModelListItem':
			return HomeTotalOperationExamineListModelListItem().fromJson(json);			case 'HomeVideoLearnBottomModelEntity':
			return HomeVideoLearnBottomModelEntity().fromJson(json);			case 'HomeVideoLearnBottomModelData':
			return HomeVideoLearnBottomModelData().fromJson(json);			case 'MyCultivateDetailBottomPersonListEntity':
			return MyCultivateDetailBottomPersonListEntity().fromJson(json);			case 'MyCultivateDetailBottomPersonListList':
			return MyCultivateDetailBottomPersonListList().fromJson(json);			case 'CurrentCultivateListEntity':
			return CurrentCultivateListEntity().fromJson(json);			case 'CurrentCultivateListList':
			return CurrentCultivateListList().fromJson(json);			case 'HomePageDataEntity':
			return HomePageDataEntity().fromJson(json);			case 'HomePageDataList':
			return HomePageDataList().fromJson(json);			case 'HomeUnreadInformationModelEntity':
			return HomeUnreadInformationModelEntity().fromJson(json);			case 'HomeUnreadInformationModelList':
			return HomeUnreadInformationModelList().fromJson(json);			case 'HomeExamineManagerListEntity':
			return HomeExamineManagerListEntity().fromJson(json);			case 'HomeExamineManagerListList':
			return HomeExamineManagerListList().fromJson(json);			case 'HomePageTopMonthEntity':
			return HomePageTopMonthEntity().fromJson(json);			case 'HomePageTopMonthList':
			return HomePageTopMonthList().fromJson(json);			case 'HomeUnreadInformationDetailModelEntity':
			return HomeUnreadInformationDetailModelEntity().fromJson(json);			case 'MyCultivateDetailTopTotalEntity':
			return MyCultivateDetailTopTotalEntity().fromJson(json);			case 'MyCultivateDetailTopTotalList':
			return MyCultivateDetailTopTotalList().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'HomeCultivateMangagerListEntity':
			return List<HomeCultivateMangagerListEntity>();			case 'HomeCultivateMangagerListList':
			return List<HomeCultivateMangagerListList>();			case 'HomeClassroomDataVideoEntity':
			return List<HomeClassroomDataVideoEntity>();			case 'HomeClassroomDataVideoData':
			return List<HomeClassroomDataVideoData>();			case 'CultivateDeatilEntity':
			return List<CultivateDeatilEntity>();			case 'HomePageTopTotalDataEntity':
			return List<HomePageTopTotalDataEntity>();			case 'HomePageTopTotalDataData':
			return List<HomePageTopTotalDataData>();			case 'HomePageTopTotalDataDataList':
			return List<HomePageTopTotalDataDataList>();			case 'HomeClassroomDataEntity':
			return List<HomeClassroomDataEntity>();			case 'HomeClassroomDataData':
			return List<HomeClassroomDataData>();			case 'HomeTotalQuestionListSelectEntity':
			return List<HomeTotalQuestionListSelectEntity>();			case 'HomeTotalQuestionListSelectList':
			return List<HomeTotalQuestionListSelectList>();			case 'HomeExaminePersonListModelEntity':
			return List<HomeExaminePersonListModelEntity>();			case 'HomeExaminePersonListModelList':
			return List<HomeExaminePersonListModelList>();			case 'HomeQuestionModelEntity':
			return List<HomeQuestionModelEntity>();			case 'HomeQuestionModelList':
			return List<HomeQuestionModelList>();			case 'CurrentMonthExamineListEntity':
			return List<CurrentMonthExamineListEntity>();			case 'CurrentMonthExamineListList':
			return List<CurrentMonthExamineListList>();			case 'InformationDetailCommentModelEntity':
			return List<InformationDetailCommentModelEntity>();			case 'InformationDetailCommentModelData':
			return List<InformationDetailCommentModelData>();			case 'InformationDetailCommantModelDataList':
			return List<InformationDetailCommantModelDataList>();			case 'HomeTotalOperationExamineListModelEntity':
			return List<HomeTotalOperationExamineListModelEntity>();			case 'HomeTotalOperationExamineListModelList':
			return List<HomeTotalOperationExamineListModelList>();			case 'HomeTotalOperationExamineListModelListItem':
			return List<HomeTotalOperationExamineListModelListItem>();			case 'HomeVideoLearnBottomModelEntity':
			return List<HomeVideoLearnBottomModelEntity>();			case 'HomeVideoLearnBottomModelData':
			return List<HomeVideoLearnBottomModelData>();			case 'MyCultivateDetailBottomPersonListEntity':
			return List<MyCultivateDetailBottomPersonListEntity>();			case 'MyCultivateDetailBottomPersonListList':
			return List<MyCultivateDetailBottomPersonListList>();			case 'CurrentCultivateListEntity':
			return List<CurrentCultivateListEntity>();			case 'CurrentCultivateListList':
			return List<CurrentCultivateListList>();			case 'HomePageDataEntity':
			return List<HomePageDataEntity>();			case 'HomePageDataList':
			return List<HomePageDataList>();			case 'HomeUnreadInformationModelEntity':
			return List<HomeUnreadInformationModelEntity>();			case 'HomeUnreadInformationModelList':
			return List<HomeUnreadInformationModelList>();			case 'HomeExamineManagerListEntity':
			return List<HomeExamineManagerListEntity>();			case 'HomeExamineManagerListList':
			return List<HomeExamineManagerListList>();			case 'HomePageTopMonthEntity':
			return List<HomePageTopMonthEntity>();			case 'HomePageTopMonthList':
			return List<HomePageTopMonthList>();			case 'HomeUnreadInformationDetailModelEntity':
			return List<HomeUnreadInformationDetailModelEntity>();			case 'MyCultivateDetailTopTotalEntity':
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