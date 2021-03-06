import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class PersonInfomation extends StatefulWidget {
  PersonInfomation({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _PersonInfomationState createState() => _PersonInfomationState();
}

class _PersonInfomationState extends State<PersonInfomation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(this.widget.params["isme"] == "1"?'我的':'刘医生'),),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx, index){
            return _buildItemByIndex(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return GestureDetector(
        child: Container(
          color: Colors.white,
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdaper.width(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("asset/images/mine/touxiangpre.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Text('个人头像',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                      ],
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
          if(this.widget.params["isme"] == "1"){
            Navigator.pushNamed(
              context,
              '/settingPersonalHeadImage',
              arguments: {}, //　传递参数
            );
          }
        },
      );
    }else{
      /*
                Navigator.pushNamed(
                  context,
                  '/changeMobileFirst',
                  arguments: {}, //　传递参数
                );
      */
      return Container(
        child:Column(
          children: [
            GestureDetector(
              child:  Container(
                padding: EdgeInsets.all(ScreenAdaper.width(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(index == 1?"asset/images/mine/xinming.png":"asset/images/mine/shouji.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Text(index == 1?'姓名':'手机号',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                      ],
                    ),
                    Row(
                      children: [
                        Text(index == 1?(this.widget.params["isme"] == "1"?this.widget.params["name"]:'刘医生'):(this.widget.params["isme"] == "1"?this.widget.params["mobile"]:'139 0519 0433'),style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: (){
                if(index == 2&&this.widget.params["isme"] == "1"){
                  Navigator.pushNamed(
                    context,
                    '/changeMobileFirst',
                    arguments: {'mobile':this.widget.params["mobile"]}, //　传递参数
                  );
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
              color: Color(0xffe7e7e7),
              height:ScreenAdaper.height(1.5),
              width: ScreenAdaper.width(700),
            ),
          ],
        ),
      );
    }
  }
}
