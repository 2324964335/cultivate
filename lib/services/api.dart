import 'package:cultivate/components/Calendar/utils/LogUtil.dart';
import 'package:dio/dio.dart';
import '../utils/dio/safeRequest.dart';
import 'service_url.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../utils/util.dart';
class Api{
  /// 获取APP最新版本号, 演示更新APP组件
  Future<Map> getNewVersion([String version]) async {
    // TODO: 替换为你的真实请求接口，并返回数据，此处演示直接返回数据
     Map resData = await safeRequest(
       'https://5f854e4ec29abd0016190594.mockapi.io/lala/update',
       options: Options(method: 'GET'), // 请求类型
     );
    return resData ?? {};
  }

  /// 账号密码登录
  Future<Map> loginByPass(String account,String password) async {
    Map resData = await safeRequest(
      serviceUrl['app_login'],
      data: {
        'Account':account,
        'Password':md5.convert(utf8.encode(password)).toString(),
        'TenantID':"",
        'DeviceID':'',
        'Build':0
      },
      options: Options(method: 'POST'),
    );
    return resData ?? {};
  }

  /// 首页头部数据
  Future<Map> getHomePageTopData(String TokenID) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_total'] + '?TokenID=${TokenID}',
      data: {
      },
      options: Options(method: 'POST'),
    );
    return resData ?? {};
  }

  /// 首页数据
  Future<Map> getHomePageData(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_bottom']+ getByParams(params),
      data: {},
      options: Options(method: 'GET',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  String getByParams(Map params){
    if(params.keys.length == 0){
      return "";
    }
    String params_string = "?";
    params.forEach((key, value) {
      params_string = params_string + "${key}=${value}&";
    });
    params_string = params_string.substring(0,params_string.length -1);
  return params_string;
  }

  ///本月培训
  Future<Map> getCurrentCultivate(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_current_cultivate'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///本月培训详情
  Future<Map> getCurrentCultivateDetail(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_current_cultivate_detail'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///本月培训签到
  Future<Map> getSignCultivate(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_sign_cultivate'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }


  ///代人签到
  Future<Map> getDaiSignCultivate(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_dai_sign_cultivate'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///我的培训签到详情头部数据
  Future<Map> getMySignCultivateTotal(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_my_sign_cultivate_total'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///我的培训签到详情底部分类
  Future<Map> getMySignCultivateBottomFenLei(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_my_sign_cultivate_fenlei'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///本月培训
  Future<Map> getCurrentMonthExaminList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_curren_month_examine'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///本月培训人员列表
  Future<Map> getCurrentMonthExaminPersonList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_curren_month_examine_person'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页列表明细
  Future<Map> getRequestHomeItemDetail(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_item_detail'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页列表明细查看
  Future<Map> getRequestHomeItemDetailSee(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_item_detail_see'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页列表明细评论
  Future<Map> getRequestHomeItemDetailComment(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_item_detail_comment'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页列表明细点赞
  Future<Map> getRequestHomeItemDetailZan(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_item_detail_zan'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页未读公告数据列表
  Future<Map> getRequestHomeUnReadInformationList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_unread'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页未读公告数据列表详情
  Future<Map> getRequestHomeUnReadInformationItemdetail(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_unread_detail'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }


  ///首页培训管理日历请求数据
  Future<Map> getRequestHomeCultiveMangagerList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_cultive_mangager'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页考核管理日历请求数据
  Future<Map> getRequestHomeExamineMangagerList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_examine_mangager'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页微课堂列表数据
  Future<Map> getRequestHomeSmallClassData(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_small_classroom'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页微课堂列表数据播放视频
  Future<Map> getRequestHomeSmallClassItemData(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_small_classroom_item'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页微课堂列表数据播放视频底部数据
  Future<Map> getRequestHomeSmallClassItemBottomListData(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_small_classroom_item_bottom'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页公告关键词搜索
  Future<Map> getRequestHomeInformationByWords(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_information_byWords'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页题库列表数据
  Future<Map> getRequestTotalQuestionList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_total_question_list'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页题库数据
  Future<Map> getRequestQuestion(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_question_list'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页题库扣分考核项
  Future<Map> getTotalOperationExamineList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_operation_total_sheet'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }

  ///首页上报扣分考核项
  Future<Map> getRequestUploadOperationExamineList(String TokenID,Map params) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_operation_upload_sheet'],
      data: params,
      options: Options(method: 'POST',headers:{"TokenID":TokenID}),
    );
    return resData ?? {};
  }
}