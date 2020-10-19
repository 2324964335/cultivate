
import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/func.dart';
import '../../../components/alert_dialog.dart';
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
              DarkText.build(this.widget.params["mobile"]),
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
                child: Text("更换手机号",style: TextStyle(color: Colors.white),),
              ),
            ),
            onTap: (){
              FunctionUtil.popDialog(
                context,
                ShowAlertDialog(
                  title: "验证信息",

                  content: "为了保障您的合法权益，请输入您的登陆密码进行身份验证",
                  items: ['取消', '确认提交'],
                  onTap: (index) {
                    LogUtil.d('object$index');
                    if(index == 1){
                      ToastShow.show("验证成功");
//                          Navigator.pop(context);
                    ///inputNewMobile
                        Navigator.pushNamed(
                          context,
                          '/inputNewMobile',
                          arguments: {'mobile':this.widget.params["mobile"]}, //　传递参数
                        );
                    }
                  },
                  isShenhe: false,
                  isChangeMobile: true,
                ),
              );
            },
          ),
          SizedBox(height: ScreenAdaper.width(40),),
          LightText.build('更换手机号后，企业通讯录号码将同步改变'),
        ],
      )
    );
  }
}
