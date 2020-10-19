import 'package:flutter/material.dart';
import '../../../../services/api.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'home_page_top_month_entity.dart';
class HomeRequest{
  static Future<dynamic> requestHomePageMonth(String tokenID) async {
    Map resData = await Api().getHomePageTopData(tokenID);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HomePageTopMonthEntity>(resData["data"]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }
}