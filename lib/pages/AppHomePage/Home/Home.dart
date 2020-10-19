import 'dart:io';
import 'package:cultivate/utils/toast_show.dart';
import 'package:r_scan/r_scan.dart';
import '../../../components/ThirdParty/scan_camera_dialog.dart';
import '../../../components/ThirdParty/scan_dialog.dart';
import 'package:cultivate/utils/screen_adaper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';
import '../../../utils/util.dart';
import './home_widget/HomeTopHeader.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'home_request/HomeRequest.dart';
import 'package:provider/provider.dart';
import '../../../provider/appCommenNetData.dart';
import 'home_request/home_page_top_month_entity.dart';
class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CounterStore _counter;
  RScanResult result;
  GainUserModel _userModelProvider;
  HomePageTopMonthEntity _topdata = null;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    LogUtil.d('-----1');
//    Future.delayed(Duration(milliseconds: 200)).then((e) {
//      getHomeTopData();
//    });
  }

  void getHomeTopData(){
    if(_userModelProvider.getIsLogin() == true){
      HomeRequest.requestHomePageMonth(_userModelProvider.getuserModel.TokenID).then((value){
        LogUtil.d('----------${value}');
        if(value is Map){
          if(value["success"] == -1101){
            StorageUtil().removeLogin().then((value){
              _userModelProvider.setCurrenUserModel();
            });
            return;
          }
        }
        _topdata = value;
        _isLoading = false;
        setState(() {
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.d('-----2');
    super.build(context);
    _userModelProvider = Provider.of<GainUserModel>(context);
    if(_userModelProvider.getuserModel == null){
      _userModelProvider.setCurrenUserModel();
    }else{
//      getHomeTopData();
    }

    if(_userModelProvider.getIsLogin()==false){
      _topdata = null;
    }

    Future.delayed(Duration(milliseconds: 200)).then((e) {
      if(_userModelProvider.getIsLogin()==true&&_topdata == null&&_isLoading == false){
        _isLoading = true;
        getHomeTopData();
      }
//      else if(_userModelProvider.getIsLogin()==false){
//        _topdata = null;
//      }
    });
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('首页',style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Image.asset("asset/images/home/saoQR.png",width: ScreenAdaper.width(35),height: ScreenAdaper.width(35),),
            onPressed: () async {
              PermUtils.cameraPerm();
              PermissionStatus status = await Permission.camera.status;
              if (status == PermissionStatus.granted) {
                final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RScanCameraDialog()));
//              setState(() {
//                this.result = result;
//              });
                LogUtil.d('扫码结果${result.toString().split(',').join('\n')}');
               if(result != null){
                 Future.delayed(Duration(milliseconds: 200), (){
                   Navigator.pushNamed(
                     context,
                     '/courseSignSuccess',
                     arguments: {}, //　传递参数
                   );
                 });
               }
              }else{
                  ToastShow.show("请授权相机使用");
              }
            },
          ),
        ],
      ),
      body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            },
              child:   ListView.builder(
                    itemCount: 10,
                    itemBuilder: (ctx, index) {
                      return _judegeItemByIndex(context,index);
                    }
                    )
      )
    );
  }

  Widget _judegeItemByIndex(BuildContext context,int index){
    if(index == 0){
//     return HomeTopHeader();
     return Consumer<GainUserModel>(
       builder: (key, build, child){
        return HomeTopHeader(_topdata);
       }
     );
    }else{
      return _buildItem(context);
    }
  }

  Widget _buildItem(BuildContext context){
      return Container(
        padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: new ClipRRect(

            borderRadius: BorderRadius.circular(5),
            child:
                  GestureDetector(
                    child: Container(
                      color: Colors.white,
                     child: Column(
                       children: [
                         Row(

                           children: [
                             Container(

                               child: Text("2020.8 传染病防控",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                               margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                             ),
                             Container(
                               margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                               color: Color(0xFFBD4EFB),

                               padding: EdgeInsets.all(ScreenAdaper.width(10)),
                               child: Text("员工线上培训",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                             ),
                           ],
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         ),
                         Container(
                           margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                           color: Color(0xffe7e7e7),
                           height: ScreenAdaper.height(1),
                           width: ScreenAdaper.width(680),
                         ),
                         Container(
                           padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Container(
                                 child: Row(
                                   children: [
//                                     ClipOval(
//                                       child: Container(
//                                         color: Colors.lightBlueAccent,
//                                         width: ScreenAdaper.width(70),
//                                         height: ScreenAdaper.width(70),
//                                       ),
//                                     ),
                                     Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(70),height:ScreenAdaper.width(70),),
                                     SizedBox(width: ScreenAdaper.width(10),),
                                     Text("某某某",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                     SizedBox(width: ScreenAdaper.width(40),),
                                     Text("今天14:20",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                   ],
                                 ),
                               ),
                               Container(
                                 child: Row(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                       child: Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset("asset/images/home/dianzan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                           SizedBox(width: ScreenAdaper.width(5),),
                                           Text("126",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                         ],
                                       ),

                                     ),
                                     Container(
                                       margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                       child: Row(
                                         children: [
                                           Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                           SizedBox(width: ScreenAdaper.width(5),),
                                           Text("64",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                         ],
                                       ),

                                     ),
                                     Container(
                                       margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
                                       child: Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset("asset/images/home/chakan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                           SizedBox(width: ScreenAdaper.width(5),),
                                           Text("1526",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                         ],
                                       ),

                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                    ),
                    onTap: (){
                      LogUtil.d("------点击");
                      Navigator.pushNamed(
                        context,
                        '/informationDetailComment',
                        arguments: {}, //　传递参数
                      );
                    },
                  ),
                  ),
        ),
      );
  }
}
