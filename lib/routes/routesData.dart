import 'package:flutter/material.dart';
import 'routeName.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/AppHomePage/AppHomePage.dart';
import '../pages/SplashPage/SplashPage.dart';
import '../pages/TestDemo/TestDemo.dart';
import '../pages/AppHomePage/Home/CurrentMonthCultive.dart';
import '../pages/AppHomePage/Home/CurrentMonthExamine.dart';
import '../pages/AppHomePage/Home/CultiveDetail.dart';
import '../pages/AppHomePage/Home/CourseSignSuccess.dart';
import '../pages/AppHomePage/Home/CultiveSignQrcode.dart';
import '../pages/AppHomePage/Home/CultiveCourceSignDetail.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesData = {
  // 页面路由定义...
  RouteName.splashPage: (BuildContext context, {params}) => SplashPage(),
  RouteName.appHomePage: (BuildContext context, {params}) => AppHomePage(params: params),
  RouteName.error: (BuildContext context, {params}) =>
      ErrorPage(params: params),
  RouteName.testDemo: (BuildContext context, {params}) =>
      TestDemo(params: params),
  ///本月培训页面
  RouteName.currentMonthCultive: (BuildContext context, {params}) =>
      CurrentMonthCultive(params: params),
  ///本月考核页面
  RouteName.currentMonthExamine: (BuildContext context, {params}) =>
      CurrentMonthExamine(params: params),
  ///培训详情页面
  RouteName.cultiveDetail: (BuildContext context, {params}) =>
      CultiveDetail(params: params),
  ///签到成功页面
  RouteName.courseSignSuccess: (BuildContext context, {params}) =>
      CourseSignSuccess(params: params),
  ///培训签到页面
  RouteName.cultiveSignQrcode: (BuildContext context, {params}) =>
      CultiveSignQrcode(params: params),
  ///CultiveCourceSignDetail 培训详情页面
  RouteName.cultiveCourceSignDetail: (BuildContext context, {params}) =>
      CultiveCourceSignDetail(params: params),
};
