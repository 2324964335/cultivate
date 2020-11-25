import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/utils/screen_adaper.dart';
import '../home_request/home_page_top_month_entity.dart';
import '../home_request/home_page_top_total_data_entity.dart';
import '../../../../components/flutter_jd_address_selector.dart';
import '../../provider/appHomePageStore.p.dart';
import 'package:provider/provider.dart';



class HomeTopHeader extends StatefulWidget {
  final Function(String Lei,String yue) onSelected;

  final HomePageTopTotalDataData data;
  String lei = '-1';
  String yue = '-1';
  HomeTopHeader({Key key,
    this.data,
    this.lei,
    this.yue,
    this.onSelected
  });
  @override
  _HomeTopHeaderState createState() => _HomeTopHeaderState();
}

class _HomeTopHeaderState extends State<HomeTopHeader> {

//  final controller = TextEditingController();
  String benyuepeixun_string = '0';
  String benyuekaohe_string = '0';
  String daiwoqueren_string = '0';
  String weidugonggao_string = '0';

    bool isLeixing = false;
    bool isYueDu = false;

    String leixing_str = "全部";
    String yuedu_str = "全部";

  AppHomePageStore _appHomePageStore;


  void _choiceDialog(String titlee,List titleList) async {
    if(titlee == '选择类型'){
      isLeixing = true;
    }else{
      isYueDu = true;
    }
    setState(() {});
    print('======');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return JDAddressDialog(
              onSingleSelected: (title) {
//                titleList.forEach((element) {
//                  if(element.name == title){
//                    if(title == '选择日期'){
//                      timeString = element;
//                    }else if(title == '选择阅读'){
//                      readString = element;
//                    }else{
//                      remindString = element;
//                    }
//                  }
//                });
                if(titlee == '选择类型'){
                  leixing_str = title;
                  isLeixing = false;
                }else{
                  yuedu_str = title;
                  isYueDu = false;
                }
                LogUtil.d('---------${leixing_str}---------${yuedu_str}');
                this.widget.onSelected(leixing_str,yuedu_str);
                setState(() {});
              },
              title: titlee,
              titleArr: titleList,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }
  @override
  Widget build(BuildContext context) {
    _appHomePageStore = Provider.of<AppHomePageStore>(context);
    if(this.widget.yue == '-1'){
      yuedu_str = '全部';
    }else if(this.widget.yue == '0'){
      yuedu_str = '未读';
    }else if(this.widget.yue == '1'){
      yuedu_str = '已读';
    }

    if(this.widget.lei == '-1'){
      leixing_str = '全部';
    }else if(this.widget.lei == '0'){
      leixing_str = '公告';
    }else if(this.widget.lei == '1'){
      leixing_str = '员工培训';
    }else if(this.widget.lei == '2'){
      leixing_str = '员工考核';
    }else if(this.widget.lei == '3'){
      leixing_str = '微课堂';
    }

    LogUtil.d('-----------0-${this.widget.data}');
    if(this.widget.data != null){
      this.widget.data.xList.forEach((element) {
        if(element.value == "本月考核"){
          benyuekaohe_string = element.key.toString();
        }else if(element.value == "本月培训"){
          benyuepeixun_string = element.key.toString();
        }else if(element.value == "未读公告"){
          weidugonggao_string = element.key.toString();
        }else if(element.value == "待我确认"){
          daiwoqueren_string = element.key.toString();
        }
      });
    }else{
       benyuepeixun_string = '0';
       benyuekaohe_string = '0';
       daiwoqueren_string = '0';
       weidugonggao_string = '0';
    }
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          Container(
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
//                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                              SizedBox(width: 5.0,),
                                Icon(Icons.search, color: Colors.grey,),
//                                Expanded(
//                                  child:
//                                  Container(
//                                    alignment: Alignment.topLeft,
//                                  child: TextField(
////                                    controller: controller,
//                                    decoration: new InputDecoration(
//                                        contentPadding: EdgeInsets.only(top: 0.0),
////                                        hintText: 'Search',
//                                        hintStyle: TextStyle(color: Colors.black45),
//                                        border: InputBorder.none,
//                                        focusedBorder: UnderlineInputBorder(
//                                            borderSide: BorderSide(
//                                              color: Color(0xFFEEEEEE),
//                                              width: 0.8,
//                                            )),
//                                        enabledBorder: UnderlineInputBorder(
//                                            borderSide: BorderSide(
//                                              color: Colors.transparent,
//                                              width: 0.8,
//                                            )
//                                        )
//                                    ),
//                                    // onChanged: onSearchTextChanged,
//                                  ),
//                                  ),
//                                ),
//                              new IconButton(
//                                icon: new Icon(Icons.cancel),
//                                color: Colors.grey,
//                                iconSize: 18.0,
//                                onPressed: () {
////                                  controller.clear();
//                                  // onSearchTextChanged('');
//                                },
//                              ),
                              ],
                            ),
                          )
                      ),
                      onTap: (){
                        if(this.widget.data==null){
                          Navigator.pushNamed(
                            context,
                            '/login',
                            arguments: {}, //　传递参数
                          );
                        }else{
                          Navigator.pushNamed(
                            context,
                            '/homeInfomationSearch',
                            arguments: {}, //　传递参数
                          );
                        }
                      },
                    )
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdaper.width(20),left: ScreenAdaper.width(25),right: ScreenAdaper.width(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: new ClipRRect(

                            borderRadius: BorderRadius.circular(5),

                            child:
                            Container(
                              width: ScreenAdaper.width(160),
//                          color: Colors.purple,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFD094FF), Color(0xFFB448FA)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenAdaper.height(30),),
                                  Container(
                                    child: Text(benyuepeixun_string,style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: ScreenAdaper.width(10),bottom: ScreenAdaper.height(20)),
                                    child: Text("本月培训",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30)),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: (){

                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              LogUtil.d('--------');
                              Navigator.pushNamed(
                                context,
                                '/currentMonthCultive',
                                arguments: {}, //　传递参数
                              );
                            }
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
                                  width: ScreenAdaper.width(120),
                                  height: ScreenAdaper.width(120),
                                  child: Image.asset("asset/images/home/richeng.png"),
                                ),
                                Text('消息',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              _appHomePageStore.getBarTabsCont.jumpToPage(1);
//                              Navigator.pushNamed(
//                                context,
//                                '/schedule',
//                                arguments: {},
//                              );//　传递参数

                            }
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: new ClipRRect(

                            borderRadius: BorderRadius.circular(5),

                            child:
                            Container(
                              width: ScreenAdaper.width(160),
//                          color: Colors.deepOrangeAccent,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFFC79C), Color(0xFFFE6852)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenAdaper.height(30),),
                                  Container(
                                    child: Text(benyuekaohe_string,style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: ScreenAdaper.width(10),bottom: ScreenAdaper.height(20)),
                                    child: Text("本月考核",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30)),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            LogUtil.d('--------');
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              Navigator.pushNamed(
                                context,
                                '/currentMonthExamine',
                                arguments: {"examineType":0}, //　传递参数
                              );
                            }
                          },
                        ),
                        ///AllInformation
                        GestureDetector(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
                                  width: ScreenAdaper.width(120),
                                  height: ScreenAdaper.width(120),
                                  child: Image.asset("asset/images/home/gonggao.png"),
                                ),
                                Text('公告',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              Navigator.pushNamed(
                                context,
                                '/allInformation',
                                arguments: {}, //　传递参数
                              );
                            }
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child:new ClipRRect(

                            borderRadius: BorderRadius.circular(5),

                            child:
                            Container(
                              width: ScreenAdaper.width(160),
//                          color: Colors.yellow,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFFDC5B), Color(0xFFFCAF00)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenAdaper.height(30),),
                                  Container(
                                    child: Text(daiwoqueren_string,style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: ScreenAdaper.width(10),bottom: ScreenAdaper.height(20)),
                                    child: Text("待我确认",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30)),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            LogUtil.d('--------');

                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              Navigator.pushNamed(
                                context,
                                '/waitEnrollCultive',
                                arguments: {}, //　传递参数
                              );
                            }
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
                                  width: ScreenAdaper.width(120),
                                  height: ScreenAdaper.width(120),
                                  child: Image.asset("asset/images/home/weiketang.png"),
                                ),
                                Text('微课堂',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }else{
                              ///SmallClassroom
                              Navigator.pushNamed(
                                context,
                                '/smallClassroom',
                                arguments: {}, //　传递参数
                              );

                            }
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: new ClipRRect(

                            borderRadius: BorderRadius.circular(5),

                            child:
                            Container(
                              width: ScreenAdaper.width(160),
//                          color: Colors.pink,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFF9177), Color(0xFFF64640)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenAdaper.height(30),),
                                  Container(
                                    child: Text(weidugonggao_string,style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: ScreenAdaper.width(10),bottom: ScreenAdaper.height(20)),
                                    child: Text("未读公告",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30)),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                              return;
                            }
                            Navigator.pushNamed(
                              context,
                              '/noReadInfomation',
                              arguments: {}, //　传递参数
                            );
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
                                  width: ScreenAdaper.width(120),
                                  height: ScreenAdaper.width(120),
                                  child: Image.asset("asset/images/home/lilunmoni.png"),
                                ),
                                Text('理论模拟',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            if(this.widget.data==null){
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                              return;
                            }
                            Navigator.pushNamed(
                              context,
                              '/theoreticalModeling',
                              arguments: {},
                            );//　传递参数
                          },
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenAdaper.height(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: ScreenAdaper.width(345),
                        height: ScreenAdaper.height(160),
                        child: Image.asset("asset/images/home/peixunguanli.png",fit: BoxFit.fitWidth,),
                      ),
                      onTap: (){
                        if(this.widget.data==null){
                          Navigator.pushNamed(
                            context,
                            '/login',
                            arguments: {}, //　传递参数
                          );
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          '/cultiveSecondManger',
                          arguments: {},
                        );
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: ScreenAdaper.width(345),
                        height: ScreenAdaper.height(160),
                        child: Image.asset("asset/images/home/kaoheguanli.png",fit: BoxFit.fitWidth,),
                      ),
                      onTap: (){
                        if(this.widget.data==null){
                          Navigator.pushNamed(
                            context,
                            '/login',
                            arguments: {}, //　传递参数
                          );
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          '/examineManger',
                          arguments: {},
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 1.0), //阴影xy轴偏移量
                      blurRadius: 3.0, //阴影模糊程度
                      spreadRadius: 1.0 //阴影扩散程度
                  )
                ]),
//            color: Colors.white,
            height: ScreenAdaper.height(80),
            margin: EdgeInsets.only(top: ScreenAdaper.height(40)),
            width: ScreenAdaper.screenWidth(),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                    child: Row(
                      children: [
                        Text(leixing_str,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
//                      Icon(Icons.add,size: ScreenAdaper.width(25),),
                        Image.asset("asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                      ],
                    ),
                  ),
                  onTap: (){
                      _choiceDialog('选择类型', ['全部','公告','员工培训','员工考核','微课堂']);
                  },
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                    child: Row(
                      children: [
                        Text(yuedu_str,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
//                      Icon(Icons.add,size: ScreenAdaper.width(25),),
                        Image.asset("asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                      ],
                    ),
                  ),
                  onTap: (){
                    _choiceDialog('选择阅读', ['全部','已读','未读']);

                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
