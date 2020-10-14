import '../../../utils/util.dart';
import 'package:flutter/material.dart';
//import '../../../utils/screen_adaper.dart';
import '../../../components/flutter_jd_address_selector.dart';

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
  String remindString = "全部";

  @override
  void initState() {
    super.initState();
//    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('消息',style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return _buildItemByIndex(context, index);
        }),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildTopItem(context, index);
    }else{
      return _buildMessageItem(context);
    }
  }

  Widget _buildTopItem(BuildContext context,int index){
    return Container(
      height: ScreenAdaper.width(100),
      margin: EdgeInsets.only(top: ScreenAdaper.width(17)),
      padding: EdgeInsets.all(ScreenAdaper.width(20)),
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
                  Text(timeString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(35)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isTimeSelect==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(34),height:ScreenAdaper.width(34),),
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
                  Text(readString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(35)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isRead==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(34),height:ScreenAdaper.width(34),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择阅读", ['全部','已阅读','未阅读']);

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
                  Text(remindString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(35)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isRemind==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(34),height:ScreenAdaper.width(34),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择提醒", ['全部','提醒我']);

            },
          )
        ],
      ),
    );
  }

  void _choiceDialog(String titlee,List titleList) async {
    if(titlee == '选择日期'){
      isTimeSelect = true;
    }else if(titlee == '选择阅读'){
      isRead = true;
    }else{
      isRemind = true;
    }
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
                }else{
                  remindString = title;
                  isRemind = false;
                }
                setState(() {});
              },
              title: titlee,
              titleArr: titleList,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }

  Widget _buildMessageItem(BuildContext context){
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
                        Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
                        SizedBox(width: ScreenAdaper.width(20),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: ScreenAdaper.height(20),),
                            Row(
                              children: [
                                Text("微课堂《输液规则技术》",style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                                SizedBox(width: ScreenAdaper.width(40),),
                                Text('2020年8月20日',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                              ],
                            ),
                            SizedBox(height: ScreenAdaper.height(20),),
                            Container(
                              width: ScreenAdaper.width(550),
                              height: ScreenAdaper.height(60),
                              child:Text('关于2020 考试的通知的评论关于2020 考试的通知的评论关于2020 考试的通知的评论',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),maxLines: 2,),
                            ),
                            SizedBox(height: ScreenAdaper.height(20),),
                            Row(
                              children: [
                                LightText.build('接收范围：'),
                                DarkText.build('护理部'),
                                SizedBox(width: ScreenAdaper.width(15),),
                                LightText.build('未读人数：'),
                                DarkText.build('34人'),
                                SizedBox(width: ScreenAdaper.width(10),),
                                Image.asset("asset/images/message/ding.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
                                LightText.buildColor('DING一下', Color(0xffF1B900)),
                              ],
                            ),
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
//        Navigator.pushNamed(
//          context,
//          '/messageDetail',
//          arguments: {}, //　传递参数
//        );
      },
    );
  }
}
