import 'package:flutter/widgets.dart';

import '../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/appCommenNetData.dart';
import '../../../utils/LoginModel.dart';
import '../../../components/func.dart';
import '../../../components/alert_dialog.dart';
class Mine extends StatefulWidget {
  Mine({Key key, this.params}) : super(key: key);
  final params;
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  GainUserModel _userModelProvider;
  List _imageArr = ["","","asset/images/mine/jibenxinxi.png","asset/images/mine/gongzuoxinxi.png","","asset/images/mine/xiaoxitixing.png","asset/images/mine/guanyuwomen.png","","asset/images/mine/tuichudenglu.png"];
  List _titleArr = ["","","基本信息","工作信息","","消息提醒设置","关于我们","","退出登录",];

  List _noLogineImageArr = ["","","asset/images/mine/guanyuwomen.png"];
  List _noLogineTitleArr = ["","","关于我们"];
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    LogUtil.d("------a---------------");
    _userModelProvider = Provider.of<GainUserModel>(context);
    if(_userModelProvider.getuserModel == null){
      _userModelProvider.setCurrenUserModel();
    }else{
//      _currentUserModel = _userModelProvider.getuserModel;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('我的',style: TextStyle(color: Color(0xff565656)),),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Consumer<GainUserModel>(
          builder: (_, a, child) =>
          _userModelProvider.getuserModel == 0||_userModelProvider == null?
          ListView(
            children: List.generate(_noLogineTitleArr.length, (index) {
              return _buildItemByIndex(context,index);
            }),
          )
              :
          ListView(
              children: List.generate(_imageArr.length, (index) {
                return _buildItemByIndex(context,index);
              }),
            ),
              ),
            )
//      ListView(
//        children: List.generate(_noLogineImageArr.length, (index) {
//          return _buildItemByIndex(context,index);
//        }),
//      ),
    );
  }

  Widget  _buildItemByIndex(BuildContext context,int index){
      if(index == 0){
        return _buildTopHeader(context, index);
      }else if(_userModelProvider.getuserModel == 0||_userModelProvider == null?_noLogineImageArr[index]=="":_imageArr[index] == ""){
        return _buildKongBai(context, index);
      }else{
        return _buildItem(context, index);
      }
  }

  Widget _buildTopHeader(BuildContext context,int index){
    String title = "";
    if(_userModelProvider.getuserModel == 0||_userModelProvider == null){
      title = '登录';
    }else{
      title = _userModelProvider.getuserModel.Name;
    }
    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: ScreenAdaper.width(50),top: ScreenAdaper.width(60),bottom: ScreenAdaper.width(60)),
        child: Row(
          children: [
            Image.asset(_userModelProvider.getuserModel == 0||_userModelProvider == null?"asset/images/mine/unlogin.png":"asset/images/mine/touxiang.png",width: ScreenAdaper.width(105),height: ScreenAdaper.width(106),fit: BoxFit.contain,),
            SizedBox(width: ScreenAdaper.width(20),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_userModelProvider.getuserModel == 0||_userModelProvider == null?'登录':title,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(35),fontWeight: FontWeight.bold),),
                SizedBox(height: ScreenAdaper.width(14),),
                Text(_userModelProvider.getuserModel == 0||_userModelProvider == null?'点击登录，开启学习路径':_userModelProvider.getuserModel.Job,style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
              ],
            )
          ],
        ),
      ),
      onTap: (){
        if(_userModelProvider.getuserModel == 0||_userModelProvider == null){
          Navigator.pushNamed(
            context,
            '/login',
            arguments: {}, //　传递参数
          );
        }else{

        }
      },
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: ScreenAdaper.width(60),top: ScreenAdaper.width(40)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(_userModelProvider.getuserModel == 0||_userModelProvider == null?_noLogineImageArr[index]:_imageArr[index],width: ScreenAdaper.width(45),height: ScreenAdaper.width(45),),
                SizedBox(width: ScreenAdaper.width(20),),
                Text(_userModelProvider.getuserModel == 0||_userModelProvider == null?_noLogineTitleArr[index]:_titleArr[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.width(40),),
            Container(
              margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
              color: Color(0xffe7e7e7),
              height: index == 3||index == 6?ScreenAdaper.height(0):ScreenAdaper.height(1.5),
              width: ScreenAdaper.width(700),
            ),
          ],
        ),
      ),
      onTap: (){
        if(index == 2){
          ///PersonInfomation
          Navigator.pushNamed(
            context,
            '/personInfomation',
            arguments: {"isme":"1","name":_userModelProvider.getuserModel.Name,"mobile":_userModelProvider.getuserModel.MobilePhone}, //　传递参数
          );
        }else if(_titleArr[index] == '退出登录'){
          FunctionUtil.popDialog(
            context,
            ShowAlertDialog(
              title: "温馨提示",
              content: "您现在正在退出登录",
              items: ['取消', '确认退出'],
              onTap: (index) {
                LogUtil.d('object$index');
                if(index == 1){
                  StorageUtil().removeLogin().then((value){
                    _userModelProvider.setCurrenUserModel();
                  });
                }
              },
            ),
          );
        }
      },
    );
  }
  
  Widget _buildKongBai(BuildContext context,int index){
    return Container(
      height: ScreenAdaper.height(15),
      color: Color(0xfffcfcfc),
      width: ScreenAdaper.screenWidth(),
    );
  }
}
