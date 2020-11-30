import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_widget/CultivateSecondMangerGangChildWidget.dart';
import 'home_widget/CultivateSecondMangerNengChildWidget.dart';
class CultiveSecondManger extends StatefulWidget {
  CultiveSecondManger({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CultiveSecondMangerState createState() => _CultiveSecondMangerState();
}

class _CultiveSecondMangerState extends State<CultiveSecondManger>  with SingleTickerProviderStateMixin {

  // 选项卡控制器
  TabController _tabController;
  bool _isFromMangager = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 2, vsync: this,);
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
        title: Text('培训管理',style: TextStyle(color: Colors.black45),),
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
                    Tab(text: "能级培训",),
                    Tab(text: "岗位培训",),
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
                      CultivateSecondMangerNengChildWidget(),
                      CultivateSecondMangerGangChildWidget(1),
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
