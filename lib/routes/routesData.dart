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
import '../pages/AppHomePage/Home/ExaminePersonListResult.dart';
import '../pages/AppHomePage/Home/ExaminePersonResultDetail.dart';
import '../pages/AppHomePage/Home/NoReadInfomation.dart';
import '../pages/AppHomePage/Home/InformationDetail.dart';
import '../pages/AppHomePage/Home/InformationDetailComment.dart';
import '../pages/AppHomePage/Home/Schedule.dart';
import '../pages/AppHomePage/Home/AllInformation.dart';
import '../pages/AppHomePage/Home/AddSchedule.dart';
import '../pages/AppHomePage/Home/AddScheduleRemind.dart';
import '../pages/AppHomePage/Home/SelectTotalRecivePerson.dart';
import '../pages/AppHomePage/Home/SmallClassroom.dart';
import '../pages/AppHomePage/Home/SmallClassroomLearnStep.dart';
import '../pages/AppHomePage/Home/LessonPlayer.dart';
import '../pages/AppHomePage/Home/TheoreticalModeling.dart';
import '../pages/AppHomePage/Examine/AnswerQuestion.dart';
import '../pages/AppHomePage/Examine/WrongQuestionReview.dart';
import '../pages/AppHomePage/Home/CultivateManger.dart';
import '../pages/AppHomePage/Home/AddCultivatePlan.dart';
import '../pages/AppHomePage/Home/ExamineManger.dart';
import '../pages/AppHomePage/Home/TheoryExamineQuestion.dart';
import '../pages/AppHomePage/Mine/Login.dart';
import '../pages/AppHomePage/Home/TheoryExamineQuestionDetail.dart';
import '../pages/AppHomePage/Message/MessageDetail.dart';
import '../pages/AppHomePage/Mine/SettingPersonalHeadImage.dart';
import '../pages/AppHomePage/Mine/AboutUS.dart';
import '../pages/AppHomePage/Mine/MessageRemindSetting.dart';
import '../pages/AppHomePage/Commen/CommenWebview.dart';
import '../pages/AppHomePage/Mine/WorkingMessage.dart';
import '../pages/AppHomePage/Mine/ChangeMobileFirst.dart';
import '../pages/AppHomePage/Mine/InputNewMobile.dart';
import '../pages/AppHomePage/Mine/IdentifiCode.dart';
import '../pages/AppHomePage/Home/HomeInfomationSearch.dart';
import '../pages/AppHomePage/Home/QuestionTotalSelect.dart';
import '../pages/AppHomePage/Home/QuestionWrongTotalSelect.dart';
import '../pages/AppHomePage/Contact/CollegeInfomation.dart';
import '../pages/AppHomePage/Contact/ContactSearch.dart';
import '../pages/AppHomePage/Home/CultiveSecondManger.dart';

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
  ///ExaminePersonListResult 考试结果人员列表
  RouteName.examinePersonListResult: (BuildContext context, {params}) =>
      ExaminePersonListResult(params: params),
  ///ExaminePersonResultDetail 人员考试详情页
  RouteName.examinePersonResultDetail: (BuildContext context, {params}) =>
      ExaminePersonResultDetail(params: params),
  ///NoReadInfomation 未读公告
  RouteName.noReadInfomation: (BuildContext context, {params}) =>
      NoReadInfomation(params: params),
  ///InformationDetail 公告详情
  RouteName.informationDetail: (BuildContext context, {params}) =>
      InformationDetail(params: params),
  ///InformationDetailComment 公告详情评论
  RouteName.informationDetailComment: (BuildContext context, {params}) =>
      InformationDetailComment(params: params),
  ///Schedule 日程
  RouteName.schedule: (BuildContext context, {params}) =>
      Schedule(params: params),
  ///AllInformation 所有公告
  RouteName.allInformation: (BuildContext context, {params}) =>
      AllInformation(params: params),
  ///AddSchedule 添加日程
  RouteName.addSchedule: (BuildContext context, {params}) =>
      AddSchedule(params: params),
  ///AddScheduleRemind 添加日程提醒
  RouteName.addScheduleRemind: (BuildContext context, {params}) =>
      AddScheduleRemind(params: params),
  ///SelectTotalRecivePerson 选择全部接受人
  RouteName.selectTotalRecivePerson: (BuildContext context, {params}) =>
      SelectTotalRecivePerson(params: params),
  ///SmallClassroom 微课堂
  RouteName.smallClassroom: (BuildContext context, {params}) =>
      SmallClassroom(params: params),
  ///SmallClassroomLearnStep 微课堂学习记录
  RouteName.smallClassroomLearnStep: (BuildContext context, {params}) =>
      SmallClassroomLearnStep(params: params),
  ///LessonPlayer 视频播放页面
  RouteName.lessonPlayer: (BuildContext context, {params}) =>
      LessonPlayer(params: params),
  ///TheoreticalModeling 理论模拟页面
  RouteName.theoreticalModeling: (BuildContext context, {params}) =>
      TheoreticalModeling(params: params),
  ///AnswerQuestion 理论模拟考试页面
  RouteName.answerQuestion: (BuildContext context, {params}) =>
      AnswerQuestion(params: params),
  ///WrongQuestionReview 错题巩固
  RouteName.wrongQuestionReview: (BuildContext context, {params}) =>
      WrongQuestionReview(params: params),
  ///CultivateManger 培训管理
  RouteName.cultivateManger: (BuildContext context, {params}) =>
      CultivateManger(params: params),
  ///AddCultivatePlan 新增培训计划
  RouteName.addCultivatePlan: (BuildContext context, {params}) =>
      AddCultivatePlan(params: params),
  ///ExamineManger 考核管理
  RouteName.examineManger: (BuildContext context, {params}) =>
      ExamineManger(params: params),
  ///TheoryExamineQuestion 理论考试试题
  RouteName.theoryExamineQuestion: (BuildContext context, {params}) =>
      TheoryExamineQuestion(params: params),
  ///Login 登录页
  RouteName.login: (BuildContext context, {params}) =>
      Login(params: params),
  ///TheoryExamineQuestionDetail 理论考题试卷结果查看
  RouteName.theoryExamineQuestionDetail: (BuildContext context, {params}) =>
      TheoryExamineQuestionDetail(params: params),
  ///消息详情页面 MessageDetail
  RouteName.messageDetail: (BuildContext context, {params}) =>
      MessageDetail(params: params),
  ///SettingPersonalHeadImage 设置个人头像
  RouteName.settingPersonalHeadImage: (BuildContext context, {params}) =>
      SettingPersonalHeadImage(params: params),
  ///AboutUS 关于我们
  RouteName.aboutUS: (BuildContext context, {params}) =>
      AboutUS(params: params),
  ///MessageRemindSetting 消息提醒设置
  RouteName.messageRemindSetting: (BuildContext context, {params}) =>
      MessageRemindSetting(params: params),
  ///CommenWebview 公共网页跳转
  RouteName.commenWebview: (BuildContext context, {params}) =>
      CommenWebview(params: params),
  ///WorkingMessage 工作信息
  RouteName.workingMessage: (BuildContext context, {params}) =>
      WorkingMessage(params: params),
  ///ChangeMobileFirst 修改手机号页面
  RouteName.changeMobileFirst: (BuildContext context, {params}) =>
      ChangeMobileFirst(params: params),
  ///InputNewMobile 输入新手机号
  RouteName.inputNewMobile: (BuildContext context, {params}) =>
      InputNewMobile(params: params),
  ///IdentifiCode 更改手机号输入验证码
  RouteName.identifiCode: (BuildContext context, {params}) =>
      IdentifiCode(params: params),
  ///HomeInfomationSearch 首页关键词搜索页面
  RouteName.homeInfomationSearch: (BuildContext context, {params}) =>
      HomeInfomationSearch(params: params),
  ///QuestionTotalSelect 总题库列表选择
  RouteName.questionTotalSelect: (BuildContext context, {params}) =>
      QuestionTotalSelect(params: params),
  ///QuestionWrongTotalSelect 总错题库列表选择
  RouteName.questionWrongTotalSelect: (BuildContext context, {params}) =>
      QuestionWrongTotalSelect(params: params),
  ///CollegeInfomation 同事个人信息
  RouteName.collegeInfomation: (BuildContext context, {params}) =>
      CollegeInfomation(params: params),
  ///ContactSearch 联系人搜索
  RouteName.contactSearch: (BuildContext context, {params}) =>
      ContactSearch(params: params),
  ///CultiveSecondManger 培训管理界面
  RouteName.cultiveSecondManger: (BuildContext context, {params}) =>
      CultiveSecondManger(params: params),
};
