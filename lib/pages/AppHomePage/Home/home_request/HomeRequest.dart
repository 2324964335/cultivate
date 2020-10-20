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

  static Future<dynamic> requestHomePageData(String tokenID,String leixing,String yuedu) async {
    Map resData = await Api().getHomePageData(tokenID,leixing,yuedu);
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
}