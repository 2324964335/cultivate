import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_widget/TheoryExamineQuestionDetailChild.dart';
class TheoryExamineQuestionDetail extends StatefulWidget {
  TheoryExamineQuestionDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _TheoryExamineQuestionDetailState createState() => _TheoryExamineQuestionDetailState();
}

class _TheoryExamineQuestionDetailState extends State<TheoryExamineQuestionDetail>  with SingleTickerProviderStateMixin {

  // 选项卡控制器
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 2, vsync: this,);

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查看试卷',style: TextStyle(color: Colors.black45),),
      ),
      body: Container(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: ScreenAdaper.width(30),bottom: ScreenAdaper.width(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('考核项目：2020年跨科室晋级操作考',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25),fontWeight: FontWeight.bold),),
                      SizedBox(width: ScreenAdaper.width(10),),
                      Text('评分：95分',style: TextStyle(color: Colors.red,fontSize: ScreenAdaper.sp(25),fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(
                  height: ScreenAdaper.height(110),
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(text: "全部",),
                    Tab(text: "错题",),
                  ],
                    isScrollable: true,
                    indicatorColor: CommenColor.commen(),
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(bottom: 10.0),
                    labelColor: Color(0xff565656),
                    labelStyle: TextStyle(
                      fontSize: ScreenAdaper.sp(30),
                    ),

                    unselectedLabelColor: Color(0xff565656),
                    unselectedLabelStyle: TextStyle(
                      fontSize: ScreenAdaper.sp(30),
                    ),
                  ),
                ),
                Container(
                  height: ScreenAdaper.height(0.5),
                  color: Colors.black12,
                  width: ScreenAdaper.screenWidth(),
                ),
                Container(
                  height: ScreenAdaper.height(950),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      TheoryExamineQuestionDetailChild(),
                      TheoryExamineQuestionDetailChild(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
