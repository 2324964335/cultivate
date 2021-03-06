import 'package:flutter/material.dart';
import '../../../../services/api.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'home_page_top_month_entity.dart';
import 'home_page_top_total_data_entity.dart';
import 'home_page_data_entity.dart';
import 'current_cultivate_list_entity.dart';
import 'cultivate_deatil_entity.dart';
import 'my_cultivate_detail_top_total_entity.dart';
import 'my_cultivate_detail_bottom_person_list_entity.dart';
import 'current_month_examine_list_entity.dart';
import 'information_detail_comment_model_entity.dart';
import 'home_unread_information_model_entity.dart';
import 'home_unread_information_detail_model_entity.dart';
import 'home_cultivate_mangager_list_entity.dart';
import 'home_classroom_data_entity.dart';
import 'home_classroom_data_video_entity.dart';
import 'home_examine_manager_list_entity.dart';
import 'home_total_question_list_select_entity.dart';
import 'home_video_learn_bottom_model_entity.dart';
import '../../Examine/home_question_model_entity.dart';
import 'home_examine_person_list_model_entity.dart';
import 'home_total_operation_examine_list_model_entity.dart';
import 'cultivate_manger_level_model_entity.dart';
import 'cultivate_manger_neng_data_list_entity.dart';
class HomeRequest{
  static Future<dynamic> requestHomePageMonth(String tokenID) async {
    Map resData = await Api().getHomePageTopData(tokenID);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomePageTopTotalDataEntity>(resData);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  static Future<dynamic> requestHomePageData(String tokenID,Map params) async {
    Map resData = await Api().getHomePageData(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomePageDataEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  static Future<dynamic> requestCurrentCultivateData(String tokenID,Map params) async {
    Map resData = await Api().getCurrentCultivate(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CurrentCultivateListEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  static Future<dynamic> requestCurrentCultivateDeatilData(String tokenID,Map params) async {
    Map resData = await Api().getCurrentCultivateDetail(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CultivateDeatilEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  ///本人签到
  static Future<dynamic> requestSignCultivateData(String tokenID,Map params) async {
    Map resData = await Api().getSignCultivate(tokenID,params);
    LogUtil.d(resData);
//    if (resData['success'] == 1){
//      return JsonConvert.fromJsonAsT<CultivateDeatilEntity>(resData['data'][0]);
//    }else if(resData['success'] == -1101){
//      return resData;
//    }else{
//      return null;
//    }
  return resData;
  }

  ///代人签到
  static Future<dynamic> requestDaiSignCultivateData(String tokenID,Map params) async {
    Map resData = await Api().getDaiSignCultivate(tokenID,params);
    LogUtil.d(resData);
//    if (resData['success'] == 1){
//      return JsonConvert.fromJsonAsT<CultivateDeatilEntity>(resData['data'][0]);
//    }else if(resData['success'] == -1101){
//      return resData;
//    }else{
//      return null;
//    }
  return resData;
  }

  ///我的培训签到详情
  static Future<dynamic> requestMyCultivateSignTotal(String tokenID,Map params) async {
    Map resData = await Api().getMySignCultivateTotal(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<MyCultivateDetailTopTotalEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  ///我的培训签到详情底部分类
  static Future<dynamic> requestMyCultivateSignBottomFeiLei(String tokenID,Map params) async {
    Map resData = await Api().getMySignCultivateBottomFenLei(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<MyCultivateDetailBottomPersonListEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  ///本月培训列表 getCurrentMonthExaminList
  static Future<dynamic> requestCurrentMonthExaminList(String tokenID,Map params) async {
    Map resData = await Api().getCurrentMonthExaminList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CurrentMonthExamineListEntity>(resData['data'][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  ///本月考核人员列表 getCurrentMonthExaminList
  static Future<dynamic> requestCurrentMonthExaminPersonList(String tokenID,Map params) async {
    Map resData = await Api().getCurrentMonthExaminPersonList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeExaminePersonListModelEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }


  ///首页公告列表明细
  static Future<dynamic> requestHomeItemDetail(String tokenID,Map params,String linkId) async {
    Map resData = await Api().getRequestHomeItemDetail(tokenID,params,linkId);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<InformationDetailCommentModelData>(resData["data"][0]);
    }else{
      return null;
    }
  }

  ///首页公告列表明细
  static Future<dynamic> requestHomeItemDetailTop(String tokenID,Map params,String linkId) async {
    Map resData = await Api().getRequestHomeItemDetailTop(tokenID,params,linkId);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CultivateDeatilEntity>(resData["data"]);
    }else{
      return null;
    }
  }

  ///首页公告列表明细查看
  static Future<dynamic> requestHomeItemDetailSee(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeItemDetailSee(tokenID,params);
    LogUtil.d(resData);
  }

  ///首页公告列表明细点赞
  static Future<dynamic> requestHomeItemDetailZan(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeItemDetailZan(tokenID,params);
    LogUtil.d(resData);
    return resData;
  }

  ///首页公告列表明细点赞
  static Future<dynamic> requestHomeItemDetailComment(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeItemDetailComment(tokenID,params);
    LogUtil.d(resData);
    return resData;
  }

  ///首页未读公告列表
  static Future<dynamic> requestHomeUnreadInformation(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeUnReadInformationList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeUnreadInformationModelEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }


  ///首页未读公告列表详情
  static Future<dynamic> requestHomeUnreadInformationDentail(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeUnReadInformationItemdetail(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeUnreadInformationDetailModelEntity>(resData['data']);
    }else{
      return null;
    }
  }

  ///首页培训管理日历请求数据
  static Future<dynamic> requestHomeCultiveMangagerList(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeCultiveMangagerList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeCultivateMangagerListEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///首页考核管理日历请求数据
  static Future<dynamic> requestHomeExamineMangagerList(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeExamineMangagerList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeExamineManagerListEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///首页微课堂列表数据
  static Future<dynamic> requestHomeSmallClassData(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeSmallClassData(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeClassroomDataEntity>(resData);
    }else{
      return null;
    }
  }


  ///首页微课堂列表点击播放视频
  static Future<dynamic> requestHomeSmallClassItemData(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeSmallClassItemData(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeClassroomDataVideoEntity>(resData);
    }else{
      return null;
    }
  }

  ///首页微课堂列表视频底部数据
  static Future<dynamic> requestHomeSmallClassItemBottomListData(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeSmallClassItemBottomListData(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeVideoLearnBottomModelEntity>(resData);
    }else{
      return null;
    }
  }

  ///首页公告关键词搜索
  static Future<dynamic> requestHomeInformationByWords(String tokenID,Map params) async {
    Map resData = await Api().getRequestHomeInformationByWords(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomePageDataEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///题库列表
  static Future<dynamic> requestTotalQuestionList(String tokenID,Map params) async {
    Map resData = await Api().getRequestTotalQuestionList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeTotalQuestionListSelectEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///获取题库
  static Future<dynamic> requestQuestion(String tokenID,Map params) async {
    Map resData = await Api().getRequestQuestion(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeQuestionModelEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///操作考扣分项
  static Future<dynamic> requestTotalOperationExamineList(String tokenID,Map params) async {
    Map resData = await Api().getTotalOperationExamineList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomeTotalOperationExamineListModelEntity>(resData['data'][0]);
    }else{
      return null;
    }
  }

  ///上报操作考扣分项
  static Future<dynamic> requestUploadOperationExamineList(String tokenID,Map params) async {
    Map resData = await Api().getRequestUploadOperationExamineList(tokenID,params);
    LogUtil.d(resData);
//    if (resData['success'] == 1){
//      return JsonConvert.fromJsonAsT<HomeTotalOperationExamineListModelEntity>(resData['data'][0]);
//    }else{
//      return null;
//    }
  return resData;
  }

  ///获取培训管理能级列表
  static Future<dynamic> requestCultivateMangerLevelList(String tokenID) async {
    Map resData = await Api().getRequestCultivateMangerLevelList(tokenID);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CultivateMangerLevelModelEntity>(resData);
    }else{
      return null;
    }
  }

  ///获取培训管理能级培训培训列表
  static Future<dynamic> requestCultivateMangerNengList(String tokenID,Map params) async {
    Map resData = await Api().getRequestCultivateMangerNengList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<CultivateMangerNengDataListEntity>(resData);
    }else{
      return null;
    }
  }


}