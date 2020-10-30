import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_widget/CurrentMonthCultiveChildWidget.dart';
class CurrentMonthCultive extends StatefulWidget {
  CurrentMonthCultive({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CurrentMonthCultiveState createState() => _CurrentMonthCultiveState();
}

class _CurrentMonthCultiveState extends State<CurrentMonthCultive>  with SingleTickerProviderStateMixin {

  // 选项卡控制器
  TabController _tabController;
  bool _isFromMangager = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync: this,);
    LogUtil.d('----------${this.widget.params}');
    if(this.widget.params["isFromManager"] == 1){
      _isFromMangager = true;
    }
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
        title: Text(_isFromMangager==true?'我的培训管理':'本月培训',style: TextStyle(color: Colors.black45),),
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
                    Tab(text: "我的报名",),
                    Tab(text: "我发起的",),
                    Tab(text: "我培训的",),
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
                      CurrentMonthCultiveChildWidget(0),
                      CurrentMonthCultiveChildWidget(1),
                      CurrentMonthCultiveChildWidget(2),
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
