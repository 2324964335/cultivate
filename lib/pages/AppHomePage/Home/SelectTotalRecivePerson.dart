import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class SelectTotalRecivePerson extends StatefulWidget {
  SelectTotalRecivePerson({Key key, this.params}) : super(key: key);
  final params;
  @override
  _SelectTotalRecivePersonState createState() => _SelectTotalRecivePersonState();
}

class _SelectTotalRecivePersonState extends State<SelectTotalRecivePerson> {

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
    return Scaffold(
        appBar: AppBar(
          title: Text('选择接收人'),
        ),
        body:
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:
            Stack(
              children: [
                Positioned(
                    child:
                    Container(
                      child:
                      ListView(
                          children: List.generate(2+bumenDataList.length + changyongDataList.length, (index) {
                            return _judgeItemByIndex(context, index);
                          }),
                        ),
                    ),
                    left: 0,
                    bottom: ScreenAdaper.height(131),
                    right: 0,
                    top: 0),
                Positioned(
                  child: _buildBottomTool(),
                  left: 0,
                  bottom: 0,),
              ],
              alignment: Alignment.center,
            )
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

//  Widget _judge(bool single){
//    if(single){
//      return Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),);
//    }else{
//      return Row(
//        children: [
//          Image.asset("asset/images/home/addScheduleRemindSelect.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
//          SizedBox(width: ScreenAdaper.width(10),),
//          Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
//    ],
//      );
//    }
//  }

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
//                  Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                  single==false?
                  Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),):
                  Row(
                  children: [
                  Image.asset("asset/images/home/addScheduleRemindSelect.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Text(data[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                      ],
                    ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenAdaper.width(40)),
                        child: Image.asset("asset/images/SelectTotalRecivePerson/jianttou.png",width: ScreenAdaper.width(40),height: ScreenAdaper.width(45),),
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
                Image.asset(index == 0?"asset/images/SelectTotalRecivePerson/bumen.png":"asset/images/SelectTotalRecivePerson/changyong.png",width: ScreenAdaper.width(30),height: ScreenAdaper.width(30),),
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

  Widget _buildBottomTool(){
    return Container(
//      margin: EdgeInsets.only(left: 0,right: 0),
        color: Colors.transparent,
        width: ScreenAdaper.width(745),
        height: ScreenAdaper.height(130),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: ScreenAdaper.width(40),right: ScreenAdaper.width(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('已选择（11）',style: TextStyle(color: Color(0xff00D08D),fontSize: ScreenAdaper.sp(25)),),
            GestureDetector(
              child:
              new ClipRRect(

                borderRadius: BorderRadius.circular(ScreenAdaper.width(75)),
                child:
                Container(
                  height: ScreenAdaper.width(70),
                  width: ScreenAdaper.width(340),
                  alignment: Alignment.center,
                  color: Color(0xFF00D08D),
                  child: Text("确定",style: TextStyle(color: Colors.white),),
                ),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        )
    );
  }
}
