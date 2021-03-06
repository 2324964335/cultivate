import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import './contact_request/ContactRequest.dart';
import './contact_request/contact_list_entity.dart';
import '../../../provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
class Contact extends StatefulWidget {
  Contact({Key key, this.params}) : super(key: key);
  final params;

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  GainUserModel _userModelProvider;
  final controller = TextEditingController();

  ContactListEntity _totalData = null;
  bool _isLoading = false;



  void getContact(){
    if(_userModelProvider.getIsLogin() == true) {
      _totalData = null;
      ContactRequest.requestContactList(StorageUtil()
          .getSureUserModel()
          .TokenID).then((value) {
        _totalData = value;
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
//    getContact();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> _handleRefresh() async {
    getContact();
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
      _totalData = null;
    }
//    LogUtil.d('----54----${_topdata}------${_userModelProvider.getIsLogin()}-------${_isLoading}');
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      if(_userModelProvider.getIsLogin()==true&&_totalData == null&&_isLoading == false){
        _isLoading = true;
        getContact();
      }else if(_userModelProvider.getIsLogin()==false&&_isLoading == false){
        _isLoading = true;
        _totalData = null;
        setState(() {
        });
      }
    });

    Future.delayed(Duration(milliseconds: 2000)).then((e) {
      _isLoading = false;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        automaticallyImplyLeading: false,
      ),
      body:
        GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child:
                  RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child:
                              ListView(
                                children: List.generate(_totalData==null?2:1+ _totalData.data[0].xList.length, (index) {
                                  return _judgeItemByIndex(context, index);
                                }),
                              ),
                  )
        )
    );
  }

  Widget _judgeItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildItemHeader(context, index);
    }else{
      if(_totalData==null){
        return _buildGNoData(context);
      }else{
        return _buildItem(context, index-1, true);
      }
    }
  }

  Widget _buildGNoData(BuildContext context){
    return GestureDetector(
      child: Container(
        width: ScreenAdaper.width(750),
        height: ScreenAdaper.width(700),
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


  Widget _buildItem(BuildContext context,int index,bool single){
    ContactListDataList item = _totalData.data[0].xList[index];
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: ScreenAdaper.width(80),top: ScreenAdaper.width(35),bottom: ScreenAdaper.width(35)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.wardName + "(" + item.empInfo[0].empList.length.toString() + ')',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
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
          Navigator.pushNamed(
            context,
            '/contactList',
            arguments: {"list":item.empInfo[0].empList,"wardName":item.wardName}, //　传递参数
          );
      },
    );
  }

  Widget _buildItemHeader(BuildContext context,int index){
    return Container(
      child: Column(
        children: [
          index == 0? Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.only(top: ScreenAdaper.height(20)),
              child: Container(
                height: 52.0,
                child: new Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      child: new Card(
                          child: new Container(
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 5.0,),
                                Icon(Icons.search, color: Colors.grey,),
//                              Expanded(
//                                child: Container(
//                                  alignment: Alignment.center,
//                                  child: TextField(
//                                    controller: controller,
//                                    decoration: new InputDecoration(
//                                        contentPadding: EdgeInsets.only(top: 0.0),
////                                        hintText: 'Search',
//                                        hintStyle: TextStyle(color: Colors.black45),
//                                        border: InputBorder.none,
//                                        enabledBorder: UnderlineInputBorder(
//                                            borderSide: BorderSide(
//                                              color: Colors.transparent,
//                                              width: 0.8,
//                                            )
//                                        )
//                                    ),
//                                    // onChanged: onSearchTextChanged,
//                                  ),
//                                ),
//                              ),
//                              new IconButton(
//                                icon: new Icon(Icons.cancel),
//                                color: Colors.grey,
//                                iconSize: 18.0,
//                                onPressed: () {
//                                  controller.clear();
//                                  // onSearchTextChanged('');
//                                },
//                              ),
                              ],
                            ),
                          )
                      ),
                      onTap: (){
                        if(_userModelProvider.getIsLogin() == false){
                          Navigator.pushNamed(
                            context,
                            '/login',
                            arguments: {}, //　传递参数
                          );
                        }else{
                          Navigator.pushNamed(
                            context,
                            '/contactSearch',
                            arguments: {"params":_totalData}, //　传递参数
                          );
                        }
                      },
                    )
                ),
              ),
            ),
          ):Container(),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(30),bottom: ScreenAdaper.width(30)),
            child: Row(
              children: [
                Image.asset("asset/images/contact/bumen.png",width: ScreenAdaper.width(30),height: ScreenAdaper.width(30),),
                SizedBox(width: ScreenAdaper.width(10),),
                Text(_totalData==null?"暂无数据":_totalData.data[0].hosName,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
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
    );
  }
}
