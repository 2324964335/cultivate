import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/UpdateAppVersion/UpdateAppVersion.dart' show getNewAppVer;
import './LoginRuest/LoginRequest.dart';
class AboutUS extends StatefulWidget {
  AboutUS({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {

  List data = ["服务与协议","隐私政策","版本更新"];

  String privacy_str = 'https://www.baidu.com';
  String service_str = 'https://www.baidu.com';

  void getAboutUSData(){
    MineRequest.requestAboutUS().then((value){
      LogUtil.d('-----------${value}');
      if(value['success'] == 1){
        (value["data"] as List).forEach((element) {
          if(element["key"] == "Privacy"){
              privacy_str = element["value"];
          }else if(element["key"] == "Service"){
              service_str = element["value"];
          }
        });
      }
//      setState(() {
//      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAboutUSData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('关于我们'),),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx,index){
              return _buildItemByIndex(context, index);
            }),
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildHeaderItem(context, index);
    }else{
      return _buildItem(context, index-1);
    }
  }

  Widget _buildHeaderItem(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: ScreenAdaper.width(50),top: ScreenAdaper.width(100)),
      color: Colors.white,
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/images/mine/logo.png",width: ScreenAdaper.width(140),height: ScreenAdaper.width(110),),
              SizedBox(width: ScreenAdaper.width(5),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('培训考核',style: TextStyle(color: Color(0xffFF5B3E),fontSize: ScreenAdaper.sp(50)),),
                  ),
                  SizedBox(height: ScreenAdaper.width(10),),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Version 1.0.0',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(28)),),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: ScreenAdaper.width(90),),
//          Line.build()
        ],
      )
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(5),bottom: ScreenAdaper.width(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(40)),
                      child: Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(40),height: ScreenAdaper.width(45),),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                color: Color(0xffe7e7e7),
                height:ScreenAdaper.height(1.5),
                width: ScreenAdaper.width(700),
              ),
            ],
          ),
        ),
        onTap: (){

          if(index == 0){
            Navigator.pushNamed(
              context,
              '/commenWebview',
              arguments: {"url":service_str,"title":"服务与协议"}, //　传递参数
            );
          }else if(index == 1){
            Navigator.pushNamed(
              context,
              '/commenWebview',
              arguments: {"url":privacy_str,"title":"隐私政策"}, //　传递参数
            );
          }else{
            getNewAppVer();
          }

        },
      ),
    );
  }
}
