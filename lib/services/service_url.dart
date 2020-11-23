// 定义所有接口请求url链接。。。
const appurlPro = "http://app.hosmart.com:7194/api/UPF/";

const serviceUrl = {
   'app_login': appurlPro +'Account/Login', ///登录接口
   'app_home_total':appurlPro + 'Education/Main/GetMonthTotal', ///首页头部数据
   'app_home_bottom':appurlPro + 'Notice/Main/NoticeList', ///首页底部数据
   'app_current_cultivate':appurlPro + 'Education/ToMonth/GetEduList', /// 本月培训
   'app_current_cultivate_detail':appurlPro + 'Education/GetEduDetail', /// 本月培训详情
   'app_sign_cultivate':appurlPro + 'Education/EduDetail/EduSign', /// 签到
   'app_dai_sign_cultivate':appurlPro + 'Education/EduDetail/EduDaiSign', /// 代签到
   'app_my_sign_cultivate_total':appurlPro + 'Education/EduDetail/EduSign/GetUserEduTotal', /// 我的签到培训详情总
   'app_my_sign_cultivate_fenlei':appurlPro + 'Education/EduDetail/EduSign/GetUserEduList', /// 我的签到培训详情分类
   'app_curren_month_examine':appurlPro + 'Examine/ToMonth/GetCheckList', ///本月培训列表
   'app_curren_month_examine_person':appurlPro + 'Examine/ToMonth/GetCheckPersonList', ///本月考核人员列表
   'app_home_item_detail':appurlPro + 'Notice/NoticeList/', ///首页列表明细详情
   'app_home_item_detail_see':appurlPro + 'Notice/NoticeList/Detail/See', ///首页列表明细详情查看
   'app_home_item_detail_zan':appurlPro + 'Notice/NoticeList/Detail/Likes', ///首页列表明细详情点赞
   'app_home_item_detail_comment':appurlPro + 'Notice/NoticeList/Detail/Comment', ///首页列表明细详情评论
   'app_home_unread':appurlPro + 'Notice/GetEduNotice', ///首页未读公告数据列表
   'app_home_unread_detail':appurlPro + 'Notice/NoticeList/GetEduNoticeDetail', ///首页未读公告数据列表详情页
   'app_home_cultive_mangager':appurlPro + 'Education/EduManagementList', ///首页培训管理日历请求数据
   'app_home_examine_mangager':appurlPro + 'Examine/ExamineManagementList', ///首页考核管理日历请求数据
   'app_home_small_classroom':appurlPro + 'Train/TrainList', ///首页微课堂列表数据
   'app_home_small_classroom_item':appurlPro + 'Train/TrainList/TrainPlay', ///首页微课堂列表视频数据
   'app_home_small_classroom_item_bottom':appurlPro + 'Train/TrainList/TrainCategoryList', ///首页微课堂列表视频底部数据
   'app_home_information_byWords':appurlPro + 'Notice/Main/QryEduList', ///首页公告关键词搜索
   'app_home_total_question_list':appurlPro + 'Questions/QuestionBank', ///首页题库列表
   'app_home_question_list':appurlPro + 'Questions/QuestionBank/GetQuestionList', ///首页题库
   'app_home_operation_total_sheet':appurlPro + 'Examine/Operate/Sheet/DeductionTtem', ///首页操作考扣分项
   'app_home_operation_upload_sheet':appurlPro + 'Examine/Operate/Staff/Sheet/SaveSheetItem', ///首页操作考上报
   'app_contact_list':appurlPro + 'Notice/Contact/WardList',///Notice/Contact/WardList 通讯录列表
};
