import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/text_field.dart';
import '../../../provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
import 'LoginRuest/LoginRequest.dart';
class Login extends StatefulWidget {
  Login({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (ctx,index){
                return _buildItemByIndex(context, index);
              }),
        ),
      )
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index== 0){
      return _buildHeader();
    }else{
      return _buildItem();
    }
  }

  Widget _buildHeader(){
    return Container(
      margin: EdgeInsets.only(bottom: ScreenAdaper.width(50),top: ScreenAdaper.width(100)),
      child:Row(
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
                child: Text('护理培训教育考试',style: TextStyle(color: Color(0xffFF5B3E),fontSize: ScreenAdaper.sp(28)),),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: password()
    );
  }
}


class password extends StatefulWidget {
  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  GainUserModel _userModelProvider;


  TextEditingController _namePassController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodePassName = FocusNode();
  final FocusNode _nodePwd = FocusNode();
  bool _isClickPass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namePassController.addListener(_verifyPass);
    _passwordController.addListener(_verifyPass);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _namePassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userModelProvider = Provider.of<GainUserModel>(context);

    return _buildPasswordLogin(context);
  }

  Widget _buildPasswordLogin(BuildContext context){
    return Container(
        child:_buildPassBody()
    );
  }

  void _verifyPass() {
    String name = _namePassController.text;
    print('name $name');
    String password = _passwordController.text;
    print('password $password');
    if (name.isEmpty || name.length < 3) {
      setState(() {
        _isClickPass = false;
      });
      return;
    }

    if (password.isEmpty || password.length < 3) {
      setState(() {
        _isClickPass = false;
      });
      return;
    }
    setState(() {
      _isClickPass = true;
    });
  }

  _loginPass() {
//    BotToast.showLoading(
//        duration: Duration(milliseconds: 700)
//    );
    print('login action');
    LoginByPass.requestLoginByPASS(_namePassController.text, _passwordController.text).then((value){
      LogUtil.d(value);
      if (value != null){
        _userModelProvider.setCurrenUserModel();
        Navigator.pop(context);
      }else{
        ToastShow.show('登录失败');
      }
    });
  }

  _buildPassBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextField(
            focusNode: _nodePassName,
            placeHolder: '请输入账号',
            maxLength: 11,
            keyboardType: TextInputType.phone,
            controller: _namePassController,
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            focusNode: _nodePwd,
            placeHolder: '请输入密码',
            maxLength: 16,
            controller: _passwordController,
            isInputPwd: true,
          ),
          SizedBox(height: ScreenAdaper.width(70),),
          new ClipRRect(
            borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
            child:Container(
                width: ScreenAdaper.width(640),
//                margin: EdgeInsets.only(top: 25),
                height: ScreenAdaper.width(90),
    //            color: Colors.orange,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF9177), Color(0xFFF64640)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: FlatButton(
                  disabledColor: Colors.transparent,
                  disabledTextColor: Colors.white,
                  textColor: Colors.white,
                  color: Colors.transparent,
                  //必填参数，按下按钮时触发的回调，接收一个方法，传null表示按钮禁用，会显示禁用相关样式
                  onPressed: _isClickPass ? _loginPass : null,
                  child: Text(
                    '登录',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 16,
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Text(
                '忘记密码',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/changeMobileFirst',
                  arguments: {}, //　传递参数
                );
              },
            ),
          ),
          SizedBox(
            height: ScreenAdaper.width(170),
          ),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: LightText.build('版权信息'),
              onPressed: () {
//                Navigator.pushNamed(
//                  context,
//                  '/registerv',
//                  arguments: {}, //　传递参数
//                );
              },
            ),
          )
        ],
      ),
    );
  }
}