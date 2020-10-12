import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_widget/TheoryExamineQuestionChild.dart';
class TheoryExamineQuestion extends StatefulWidget {
  TheoryExamineQuestion({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _TheoryExamineQuestionState createState() => _TheoryExamineQuestionState();
}

class _TheoryExamineQuestionState extends State<TheoryExamineQuestion>  with SingleTickerProviderStateMixin {

  // 选项卡控制器
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync: this,);

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
        title: Text('本月培训',style: TextStyle(color: Colors.black45),),
      ),
      body: Container(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: ScreenAdaper.height(110),
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(text: "单选题(35)",),
                    Tab(text: "多选题(25)",),
                    Tab(text: "判断题(40)",),
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
                  height: ScreenAdaper.height(1030),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      TheoryExamineQuestionChild(),
                      TheoryExamineQuestionChild(),
                      TheoryExamineQuestionChild(),
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
