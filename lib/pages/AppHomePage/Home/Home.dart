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
  List _bottomdata_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool _isLoading = false;
  String _lei = '-1';
  String _yue = '-1';
  bool canContinueLoading = true;
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    LogUtil.d('-----1');
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getHomeList(_lei, _yue,pageIndex);
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
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
      _getHomeList('-1', '-1',1);
    }
  }

  void _getHomeList(String lei,String yue,int pageInx){
    if(_userModelProvider.getIsLogin()==false){
      return;
    }
    if(pageIndex!=1&&canContinueLoading == false){
      ToastShow.show('暂无更多数据');
      return;
    }
    Map params = {
      "leixing":lei,
      "yuedu":yue,
      "pageIdx":pageIndex,
      "pageSize":10
    };
    HomeRequest.requestHomePageData(_userModelProvider.getuserModel.TokenID,params).then((value){
      LogUtil.d('------ffff----${value}');
      _isLoading = false;
      if(value is Map){
        if(value["success"] == -1101){
          StorageUtil().removeLogin().then((value){
//            canContinueLoading = true;
//            pageIndex = 1;
            _userModelProvider.setCurrenUserModel();
          });
          return;
        }
      }
      if(pageInx==1){
        _bottomdata_list = [];
        _bottomdata = value;
        _bottomdata_list.addAll(value.xList);
        canContinueLoading = true;
      }else{
        if((value.xList as List).length > 0) {
          _bottomdata_list.addAll(value.xList);
        }
        if((value.xList as List).length < 10){
          canContinueLoading = false;
        }
      }
      pageIndex +=1;
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _userModelProvider = Provider.of<GainUserModel>(context);
    if(_userModelProvider.getuserModel == null){
      _userModelProvider.setCurrenUserModel();
    }else{
    }

    if(_userModelProvider.getIsLogin()==false){
      _topdata = null;
      _bottomdata = null;
    }
    LogUtil.d('----54----${_topdata}------${_userModelProvider.getIsLogin()}-------${_isLoading}');
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      if(_userModelProvider.getIsLogin()==true&&_topdata == null&&_isLoading == false){
        _isLoading = true;
        _lei = '-1';
        _yue = '-1';
        canContinueLoading = true;
        pageIndex = 1;
        getHomeTopData();
      }else if(_userModelProvider.getIsLogin()==false&&_isLoading == false){
        _isLoading = true;
        _lei = '-1';
        _yue = '-1';
        canContinueLoading = true;
        pageIndex = 1;
        _bottomdata = null;
        _topdata = null;
        setState(() {
        });
      }
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
              child:   RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),
                    itemCount: _bottomdata==null?2:_bottomdata.xList.length==0?2:_bottomdata_list.length + 1,
                    controller: _scrollController,
                    itemBuilder: (ctx, index) {
                      return _judegeItemByIndex(context,index);
                    }
                ),
              )
      )
    );
  }

  Future<Null> _handleRefresh() async {
     pageIndex = 1;
    _getHomeList(_lei, _yue,pageIndex);
  }

  Widget _judegeItemByIndex(BuildContext context,int index){
    if(index == 0){
//     return HomeTopHeader();
     return Consumer<GainUserModel>(
       builder: (key, build, child){
//        return HomeTopHeader(
//            data:_topdata,
//            onSingleSelected(index,index){
//
//        });
       return HomeTopHeader(
         data: _topdata,
         onSelected: (lei,yue){
           LogUtil.d('------${lei}------${yue}');
           if(lei=='全部'){
             _lei = '-1';
           }else if(lei == '线上'){
             _lei = '1';
           }else{
             _lei = '0';
           }

           if(yue=='全部'){
             _yue = '-1';
           }else if(yue == '已读'){
              _yue = '1';
           }else{
              _yue = '0';
           }
           canContinueLoading = true;
           pageIndex = 1;
           _getHomeList(_lei, _yue,pageIndex);
         },
       );
       }
     );
    }else{
      if(_bottomdata == null||_bottomdata_list.length == 0){
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
        height: ScreenAdaper.width(400),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/images/home/zanwushuju.png",width: ScreenAdaper.width(70),height:ScreenAdaper.width(70),),
            SizedBox(height: ScreenAdaper.width(20),),
            LightText.build('暂无数据'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    HomePageDataList ittem = _bottomdata_list[index];
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

//                               color: Color(0xFFBD4EFB),

                               padding: EdgeInsets.all(ScreenAdaper.width(10)),
                               decoration: BoxDecoration(
                                 color: ittem.type==0?Color(0xFFBD4EFB):Color(0xFF00D08D),
                                 borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(3),
                                     bottomLeft: Radius.circular(3),
                                     bottomRight: Radius.circular(3),
                                     topRight: Radius.circular(3)),
                               ),
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
                        arguments: {'id':ittem.iD,'st_see':ittem.st_see}, //　传递参数
                      );
                    },
                  ),
                  ),
        ),
      );
  }
}
