import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class ChangeMobileFirst extends StatefulWidget {
  ChangeMobileFirst({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ChangeMobileFirstState createState() => _ChangeMobileFirstState();
}

class _ChangeMobileFirstState extends State<ChangeMobileFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('更换手机号'),),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx,index){
              return _buildItem();
            }),
      ),
    );
  }

  Widget _buildItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ScreenAdaper.width(60),),
          Image.asset('asset/images/mine/mobileBG.png',width: ScreenAdaper.width(240),height: ScreenAdaper.width(480),),
          SizedBox(height: ScreenAdaper.width(20),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LightText.build('您的手机号：'),
              DarkText.build('136 4455 5566'),
            ],
          ),
          SizedBox(height: ScreenAdaper.width(20),),

          GestureDetector(
            child: new ClipRRect(

              borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
              child:
              Container(
                height: ScreenAdaper.width(90),
                width: ScreenAdaper.width(480),
                alignment: Alignment.center,
                color: Color(0xFF00D08D),
                child: Text("去签到",style: TextStyle(color: Colors.white),),
              ),
            ),
            onTap: (){

            },
          ),
          SizedBox(height: ScreenAdaper.width(40),),

          LightText.build('更换手机号后，企业通讯录号码将同步改变'),
        ],
      )
    );
  }
}
