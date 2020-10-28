// 定义所有接口请求url链接。。。
const appurlPro = "http://app.hosmart.com:7194/api/UPF/";

const serviceUrl = {
   'app_login': appurlPro +'Account/Login', ///登录接口
   'app_home_total':appurlPro + 'Education/GetMonthTotal', ///首页头部数据
   'app_home_bottom':appurlPro + 'Education/GetMonthList', ///首页底部数据
   'app_current_cultivate':appurlPro + 'Education/GetEduList', /// 本月培训
   'app_current_cultivate_detail':appurlPro + 'Education/GetEduDetail', /// 本月培训详情
   'app_sign_cultivate':appurlPro + 'Education/EduSign', /// 签到培训详情
   'app_my_sign_cultivate_total':appurlPro + 'Education/GetUserEduTotal', /// 我的签到培训详情总
   'app_my_sign_cultivate_fenlei':appurlPro + 'Education/GetUserEduList', /// 我的签到培训详情分类
   'app_curren_month_examine':appurlPro + 'Education/GetCheckList', ///本月培训列表
   'app_curren_month_examine_person':appurlPro + 'Education/GetCheckUser', ///本月培训人员列表
   'app_home_item_detail':appurlPro + 'Education/EduItemDetail', ///首页列表明细详情
   'app_home_item_detail_see':appurlPro + 'Education/EduItemSee', ///首页列表明细详情查看
   'app_home_item_detail_zan':appurlPro + 'Education/EduItemLikes', ///首页列表明细详情点赞
   'app_home_item_detail_comment':appurlPro + 'Education/EduItemComment', ///首页列表明细详情评论
   'app_home_unread':appurlPro + 'Education/GetEduNotice', ///首页未读公告数据列表
   'app_home_unread_detail':appurlPro + 'Education/GetEduNoticeDetail', ///首页未读公告数据列表详情页
   'app_home_cultive_mangager':appurlPro + 'Education/EduManagementList', ///首页培训管理日历请求数据
};
