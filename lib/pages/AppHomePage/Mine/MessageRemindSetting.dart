import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class MessageRemindSetting extends StatefulWidget {
  MessageRemindSetting({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _MessageRemindSettingState createState() => _MessageRemindSettingState();
}

class _MessageRemindSettingState extends State<MessageRemindSetting> {

  List titleArr = ["消息推送通知","声音","震动"];

  bool isXiaoxi = true;

  bool isShengyin = true;

  bool isZhendong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息提醒设置'),),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (ctx,index){
              return _buildItem(context,index);
            }),
      ),
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
                margin: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LightText.build(titleArr[index]),
                    new Switch(
                      value: index == 0?this.isXiaoxi:(index == 1?this.isShengyin:this.isZhendong),
                      activeColor: Color(0xff00D08D),     // 激活时原点颜色
                      onChanged: (bool val) {
                        this.setState(() {
                          if(index == 0){
                            this.isXiaoxi = !this.isXiaoxi;
                          }else if(index == 1){
                            this.isShengyin = !this.isShengyin;
                          }else{
                            this.isZhendong = !this.isZhendong;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: ScreenAdaper.height(20),),
              Container(
                width: ScreenAdaper.width(720),
                height: ScreenAdaper.height(1),
                color: Color(0xffe7e7e7),
              ),
            ],
          ),
        ),
        onTap: (){
        },
      ),
    );
  }
}
