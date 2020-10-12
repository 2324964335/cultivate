import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_widget/CurrentMonthExamineChildWidget.dart';
class CurrentMonthExamine extends StatefulWidget {
  CurrentMonthExamine({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CurrentMonthExamineState createState() => _CurrentMonthExamineState();
}

class _CurrentMonthExamineState extends State<CurrentMonthExamine>  with SingleTickerProviderStateMixin {

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
        title: Text(widget.params["examineType"]==0?'本月考核':(widget.params["examineType"]==1?'操作考试':'理论考试'),style: TextStyle(color: Colors.black45),),
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
                    Tab(text: "待考核",),
                    Tab(text: "已考核",),
                  ],
                    isScrollable: true,
                    indicatorColor: CommenColor.commen(),
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(bottom: 10.0),
                    labelColor: Colors.black45,
                    labelStyle: TextStyle(
                      fontSize: ScreenAdaper.sp(35),
                    ),

                    unselectedLabelColor: Colors.black45,
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
                      CurrentMonthExamineChildWidget(0,widget.params["examineType"]),
                      CurrentMonthExamineChildWidget(1,widget.params["examineType"]),
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
