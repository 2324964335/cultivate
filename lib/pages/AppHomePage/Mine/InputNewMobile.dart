import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class InputNewMobile extends StatefulWidget {
  InputNewMobile({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _InputNewMobileState createState() => _InputNewMobileState();
}

class _InputNewMobileState extends State<InputNewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('输入新号码'),),
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
      padding: EdgeInsets.only(top: ScreenAdaper.height(60),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LightText.build('更换手机号后，企业通讯录号码将同步改变'),
          SizedBox(height: ScreenAdaper.width(70),),

          Row(
            children: [
              LightText.build('当前手机号：'),
              DarkText.build(this.widget.params["mobile"]),
            ],
          ),
          SizedBox(height: ScreenAdaper.width(170),),
          Row(
            children: [
              Text('+86',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(36)),),
              SizedBox(width: ScreenAdaper.width(20),),
              Container(
                height: ScreenAdaper.width(60),
                width: ScreenAdaper.width(1),
                color: Color(0xffDCDFE6),
              ),
              SizedBox(width: ScreenAdaper.width(20),),

              Text('136 3355 2266',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(36)),),
            ],
          ),
          Line.build(),
          SizedBox(height: ScreenAdaper.width(380),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: new ClipRRect(

                  borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
                  child:
                  Container(
                    height: ScreenAdaper.width(90),
                    width: ScreenAdaper.width(480),
                    alignment: Alignment.center,
                    color: Color(0xFF00D08D),
                    child: Text("更换手机号",style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    '/identifiCode',
                    arguments: {'mobile':this.widget.params["mobile"]}, //　传递参数
                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
