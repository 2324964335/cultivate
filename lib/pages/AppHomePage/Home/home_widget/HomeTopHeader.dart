import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/utils/screen_adaper.dart';
class HomeTopHeader extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                    child: Text("5",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
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
                            LogUtil.d('--------');
                            Navigator.pushNamed(
                              context,
                            '/currentMonthCultive',
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
                                  child: Image.asset("asset/images/home/richeng.png"),
                                ),
                                Text('日程',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.pushNamed(
                                context,
                                '/schedule',
                                arguments: {},
                            );//　传递参数
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
                                    child: Text("12",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
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
                            Navigator.pushNamed(
                              context,
                              '/currentMonthExamine',
                              arguments: {}, //　传递参数
                            );
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
                            Navigator.pushNamed(
                              context,
                              '/allInformation',
                              arguments: {}, //　传递参数
                            );
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
                                    child: Text("21",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
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
                            Navigator.pushNamed(
                              context,
                              '/waitEnrollCultive',
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
                                  child: Image.asset("asset/images/home/weiketang.png"),
                                ),
                                Text('微课堂',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),)
                              ],
                            ),
                          ),
                          onTap: (){
                            ///SmallClassroom
                            Navigator.pushNamed(
                              context,
                              '/smallClassroom',
                              arguments: {}, //　传递参数
                            );
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
                                    child: Text("8",style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(50),fontWeight: FontWeight.bold),),
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
                        Navigator.pushNamed(
                          context,
                          '/cultivateManger',
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
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                  child: Row(
                    children: [
                      Text('类型',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      Icon(Icons.add,size: ScreenAdaper.width(25),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                  child: Row(
                    children: [
                      Text('阅读',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      Icon(Icons.add,size: ScreenAdaper.width(25),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
