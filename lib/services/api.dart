import 'package:dio/dio.dart';
import '../utils/dio/safeRequest.dart';
import 'service_url.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
class Api{
  /// 获取APP最新版本号, 演示更新APP组件
  Future<Map> getNewVersion([String version]) async {
    // TODO: 替换为你的真实请求接口，并返回数据，此处演示直接返回数据
     Map resData = await safeRequest(
       'https://5f854e4ec29abd0016190594.mockapi.io/lala/update',
       options: Options(method: 'GET'), // 请求类型
     );
//    Map resData = {
//      "code": "0",
//      "message": "success",
//      "data": {
//        "version": "2.2.4",
//        "info": ["修复bug提升性能", "增加彩蛋有趣的功能页面", "测试功能"]
//      }
//    };
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

  /// 账号密码登录
  Future<Map> getHomePageTopData(String TokenID) async {
    Map resData = await safeRequest(
      serviceUrl['app_home_total'] + '?TokenID=${TokenID}',
      data: {
      },
      options: Options(method: 'POST'),
    );
    return resData ?? {};
  }
}