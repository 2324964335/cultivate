import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class Contact extends StatefulWidget {
  Contact({Key key, this.params}) : super(key: key);
  final params;

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  final controller = TextEditingController();

  List bumenDataList = ['南院（2346）','北院（26）','我的科室（6）','骨科（22）','内科（346）','外科（656）',];
  List changyongDataList = ['王淑珍','石海','李雷'];

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
                ListView(
                  children: List.generate(2+bumenDataList.length + changyongDataList.length, (index) {
                    return _judgeItemByIndex(context, index);
                  }),
                ),
        )
    );
  }

  Widget _judgeItemByIndex(BuildContext context,int index){
    if(index == 0||index == bumenDataList.length + 1){
      return _buildItemHeader(context, index);
    }else{
      if(index >0&&index < bumenDataList.length + 1){
        return _buildItem(context, index-1,bumenDataList,false);
      }else{
        return _buildItem(context, index-2-bumenDataList.length,changyongDataList,true);
      }
    }
  }

  Widget _buildItem(BuildContext context,int index,List data,bool single){
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
        if(single){
          Navigator.pushNamed(
            context,
            '/personInfomation',
            arguments: {"isme":"0"}, //　传递参数
          );
        }else{
          Navigator.pushNamed(
            context,
            '/contactList',
            arguments: {}, //　传递参数
          );
        }
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
                    child: new Card(
                        child: new Container(
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 5.0,),
                              Icon(Icons.search, color: Colors.grey,),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: controller,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 0.0),
//                                        hintText: 'Search',
                                        hintStyle: TextStyle(color: Colors.black45),
                                        border: InputBorder.none,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.8,
                                            )
                                        )
                                    ),
                                    // onChanged: onSearchTextChanged,
                                  ),
                                ),
                              ),
                              new IconButton(
                                icon: new Icon(Icons.cancel),
                                color: Colors.grey,
                                iconSize: 18.0,
                                onPressed: () {
                                  controller.clear();
                                  // onSearchTextChanged('');
                                },
                              ),
                            ],
                          ),
                        )
                    )
                ),
              ),
            ),
          ):Container(),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(30),bottom: ScreenAdaper.width(30)),
            child: Row(
              children: [
                Image.asset(index == 0?"asset/images/contact/bumen.png":"asset/images/contact/changyong.png",width: ScreenAdaper.width(30),height: ScreenAdaper.width(30),),
                SizedBox(width: ScreenAdaper.width(10),),
                Text(index==0?'上海第九人民医院':"常用联系人",style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
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
