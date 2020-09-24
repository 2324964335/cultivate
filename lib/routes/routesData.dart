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
import '../pages/AppHomePage/Home/ExaminePersonList.dart';
import '../pages/AppHomePage/Home/ExaminePersonUpload.dart';
import '../pages/AppHomePage/Home/ExamineDoctorTotalForm.dart';
import '../pages/AppHomePage/Mine/PersonInfomation.dart';
import '../pages/AppHomePage/Contact/ContactList.dart';
import '../pages/AppHomePage/Home/WaitEnrollPerson.dart';
import '../pages/AppHomePage/Home/WaitEnrollCultive.dart';

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
  ///ExaminePersonList 考核人员列表页面
  RouteName.examinePersonList: (BuildContext context, {params}) =>
      ExaminePersonList(params: params),
  ///ExaminePersonUpload 医生口服提交页面
  RouteName.examinePersonUpload: (BuildContext context, {params}) =>
      ExaminePersonUpload(params: params),
  ///ExamineDoctorTotalForm 医生扣分总表
  RouteName.examineDoctorTotalForm: (BuildContext context, {params}) =>
      ExamineDoctorTotalForm(params: params),
  ///PersonInfomation 用户信息详情页
  RouteName.personInfomation: (BuildContext context, {params}) =>
      PersonInfomation(params: params),
  ///ContactList 通讯录列表页
  RouteName.contactList: (BuildContext context, {params}) =>
      ContactList(params: params),
  ///WaitEnrollPerson 审核报名人员列表
  RouteName.waitEnrollPerson: (BuildContext context, {params}) =>
      WaitEnrollPerson(params: params),
  ///WaitEnrollCultive 待我确认审核培训
  RouteName.waitEnrollCultive: (BuildContext context, {params}) =>
      WaitEnrollCultive(params: params),
};
