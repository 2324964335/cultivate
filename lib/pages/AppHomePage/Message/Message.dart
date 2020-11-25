import '../../../utils/util.dart';
import 'package:flutter/material.dart';
//import '../../../utils/screen_adaper.dart';
import '../../../components/flutter_jd_address_selector.dart';
import './message_request/MessageRequest.dart';
import './message_request/message_model_list_entity.dart';
class Message extends StatefulWidget {
  Message({Key key, this.params}) : super(key: key);
  final params;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isTimeSelect = false;
  bool isRead = false;
  bool isRemind = false;

  String timeString = "全部";
  String readString = "全部";
//  String remindString = "全部";
  MessageModelListEntity _dataList = null;
  List _dataList_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool canContinueLoading = true;
  int PageIndex = 1;

  @override
  void initState() {
    getListData(1);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        getListData(PageIndex);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();

  }

  void getListData(int pageIndex){
    if(pageIndex!=1&&canContinueLoading == false){
      ToastShow.show('暂无更多数据');
      return;
    }
    int st_time = -1;
    int st_see = -1;
    if(timeString == "全部"){
      st_time = -1;
    }else if(timeString == "近一周"){
      st_time = -0;
    }else if(timeString == "近一月"){
      st_time = 1;
    }

    if(readString == "全部"){
      st_see = -1;
    }else if(readString == "未读"){
      st_see = 0;
    }else if(readString == "已读"){
      st_see = 1;
    }

    Map params = {
      'ST_Time':st_time,
      'ST_See':st_see,
      'pageIdx':PageIndex,
      'pageSize':10
    };
    MessageRequest.requestMessageList(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList_list = [];
        _dataList = value;
        _dataList_list.addAll(value.xList);
        canContinueLoading = true;
      }else{
        if((value.xList as List).length > 0) {
          _dataList_list.addAll(value.xList);
        }
        if((value.xList as List).length < 10){
          canContinueLoading = false;
        }
      }
      PageIndex +=1;
      setState(() {
      });
    });
  }

  Future<Null> _handleRefresh() async {
    PageIndex = 1;
    getListData(PageIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('消息',style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
            onRefresh: _handleRefresh,
            child:
              ListView.builder(
                  physics: new AlwaysScrollableScrollPhysics(),
                  itemCount: _dataList_list.length,
                  controller: _scrollController,
                  itemBuilder: (ctx, index) {
                    return _buildItemByIndex(context, index);
                  }
                ),
            )
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildTopItem(context, index);
    }else{
      return _buildMessageItem(context,index -1);
    }
  }

  Widget _buildTopItem(BuildContext context,int index){
    return Container(
      height: ScreenAdaper.width(80),
      margin: EdgeInsets.only(top: ScreenAdaper.width(17)),
      padding: EdgeInsets.only(top:ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),left: ScreenAdaper.width(50),right: ScreenAdaper.width(50)),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(timeString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isTimeSelect==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择日期", ['全部','当日','近一周','近一月']);
            },
          ),
          Container(
            color: Color(0xffDDDDDD),
            width: ScreenAdaper.width(1),
            height: ScreenAdaper.width(100),
          ),
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(readString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isRead==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择阅读", ['全部','已阅读','未阅读']);

            },
          ),
//          Container(
//            color: Color(0xffDDDDDD),
//            width: ScreenAdaper.width(1),
//            height: ScreenAdaper.width(100),
//          ),
//          GestureDetector(
//            child: Container(
//              color: Colors.white,
//              child: Row(
//                children: [
//                  Text(remindString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
//                  SizedBox(width: ScreenAdaper.width(10),),
//                  Image.asset(isRemind==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
//
//                ],
//              ),
//            ),
//            onTap: (){
//              _choiceDialog("选择提醒", ['全部','提醒我']);
//
//            },
//          )
        ],
      ),
    );
  }

  void _choiceDialog(String titlee,List titleList) async {
    if(titlee == '选择日期'){
      isTimeSelect = true;
    }else if(titlee == '选择阅读'){
      isRead = true;
    }
//    else{
//      isRemind = true;
//    }
    setState(() {});
    print('======');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return JDAddressDialog(
              onSingleSelected: (title) {
//                titleList.forEach((element) {
//                  if(element.name == title){
//                    if(title == '选择日期'){
//                      timeString = element;
//                    }else if(title == '选择阅读'){
//                      readString = element;
//                    }else{
//                      remindString = element;
//                    }
//                  }
//                });

                if(titlee == '选择日期'){
                  timeString = title;
                  isTimeSelect = false;
                }else if(titlee == '选择阅读'){
                  readString = title;
                  isRead = false;
                }
//                else{
//                  remindString = title;
//                  isRemind = false;
//                }
                PageIndex = 1;
                _dataList_list = [];
                getListData(PageIndex);
                setState(() {});
              },
              title: titlee,
              titleArr: titleList,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }

  Widget _buildMessageItem(BuildContext context,int index){
    MessageModelListList item = _dataList_list[index];
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: ScreenAdaper.width(40),top: ScreenAdaper.width(20),right: ScreenAdaper.width(40)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(

                      children: [
                        CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
//                        Image.asset("asse t/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
                        SizedBox(width: ScreenAdaper.width(20),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: ScreenAdaper.height(20),),
                            Row(
                              children: [
                                Text(item.title,style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
//                                SizedBox(width: ScreenAdaper.width(40),),
//                                Text(item.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                              ],
                            ),
                            SizedBox(height: ScreenAdaper.height(20),),
                            Container(
                              width: ScreenAdaper.width(550),
                              height: ScreenAdaper.height(60),
                              child:Text(item.content,style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),maxLines: 2,),
                            ),
                            SizedBox(height: ScreenAdaper.height(20),),
                            Row(
                              children: [
                                LightText.build('时间：'),
                                DarkText.build(item.beginTime),
                                SizedBox(width: ScreenAdaper.width(15),),
                              ],
                            ),
//                            SizedBox(height: ScreenAdaper.height(20),),
//                            Row(
//                              children: [
//
////                                LightText.build('接收范围：'),
////                                DarkText.build('护理部'),
////                                SizedBox(width: ScreenAdaper.width(15),),
//                                LightText.build('未读人数：'),
//                                DarkText.build('34人'),
//                                SizedBox(width: ScreenAdaper.width(10),),
//                                Image.asset("asset/images/message/ding.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
//                                LightText.buildColor('DING一下', Color(0xffF1B900)),
//                              ],
//                            ),
                          ],
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.height(18)),
              color: Color(0xffe7e7e7),
              height: ScreenAdaper.height(1),
              width: ScreenAdaper.width(680),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.pushNamed(
          context,
          '/messageDetail',
          arguments: {}, //　传递参数
        );
      },
    );
  }
}
