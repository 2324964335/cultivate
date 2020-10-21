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
import 'home_request/home_page_top_total_data_entity.dart';
import 'home_request/home_page_data_entity.dart';
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
  HomePageTopTotalDataData _topdata = null;
  HomePageDataEntity _bottomdata = null;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    LogUtil.d('-----1');
  }

  void getHomeTopData(){
    if(_userModelProvider.getIsLogin() == true){
      HomeRequest.requestHomePageMonth(_userModelProvider.getuserModel.TokenID).then((value){
        LogUtil.d('------ffff----${value}');
        _isLoading = false;
        if(value is Map){
          if(value["success"] == -1101){
            StorageUtil().removeLogin().then((value){
              _userModelProvider.setCurrenUserModel();
            });
            return;
          }
        }
        _topdata = value.data[0];
        setState(() {
        });
      });


      HomeRequest.requestHomePageData(_userModelProvider.getuserModel.TokenID,'1','1').then((value){
        LogUtil.d('------ffff----${value}');
        _isLoading = false;
        if(value is Map){
          if(value["success"] == -1101){
            StorageUtil().removeLogin().then((value){
              _userModelProvider.setCurrenUserModel();
            });
            return;
          }
        }
        _bottomdata = value;
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
      LogUtil.d('-----3');
      _userModelProvider.setCurrenUserModel();
    }else{
//      getHomeTopData();
    }

    if(_userModelProvider.getIsLogin()==false){
      LogUtil.d('-----4');
      _topdata = null;
      _bottomdata = null;
    }
    LogUtil.d('----54----${_topdata}------${_userModelProvider.getIsLogin()}-------${_isLoading}');
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      LogUtil.d('-----8');
      if(_userModelProvider.getIsLogin()==true&&_topdata == null&&_isLoading == false){
        _isLoading = true;
        LogUtil.d('-----5');
        getHomeTopData();
      }
//      else if(_userModelProvider.getIsLogin()==false){
//        _topdata = null;
//      }
    });

    Future.delayed(Duration(milliseconds: 2000)).then((e) {
      _isLoading = false;
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
                    itemCount: _bottomdata==null?2:_bottomdata.xList.length + 1,
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
      if(_bottomdata == null){
        return _buildGoToLogin(context);
      }else{
        return _buildItem(context,index-1);
      }
    }
  }

  Widget _buildGoToLogin(BuildContext context){
    return GestureDetector(
      child: Container(
        width: ScreenAdaper.width(750),
        height: ScreenAdaper.width(300),
        alignment: Alignment.center,
        child: LightText.build('暂未登录'),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    HomePageDataList ittem = _bottomdata.xList[index];
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

                               child: Text(ittem.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                               margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                             ),
                             Container(
                               margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                               color: Color(0xFFBD4EFB),

                               padding: EdgeInsets.all(ScreenAdaper.width(10)),
                               child: Text(ittem.type==0?"线下":"线上",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
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
//                                     Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(70),height:ScreenAdaper.width(70),),
                                     CachedNetworkImage(imageUrl: ittem.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(70),height: ScreenAdaper.width(70),fit: BoxFit.contain,),
                                     SizedBox(width: ScreenAdaper.width(10),),
                                     Text(ittem.trainer,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                     SizedBox(width: ScreenAdaper.width(40),),
                                     Text(ittem.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
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
                                           Text(ittem.likeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                         ],
                                       ),

                                     ),
                                     Container(
                                       margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                       child: Row(
                                         children: [
                                           Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                           SizedBox(width: ScreenAdaper.width(5),),
                                           Text(ittem.commentCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
                                           Text(ittem.viewCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
