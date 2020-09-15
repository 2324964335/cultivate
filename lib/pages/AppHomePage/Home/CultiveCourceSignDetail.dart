import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import './home_widget/CultiveCourceSignDetailChildWidget.dart';
class CultiveCourceSignDetail extends StatefulWidget {
  CultiveCourceSignDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CultiveCourceSignDetailState createState() => _CultiveCourceSignDetailState();
}

class _CultiveCourceSignDetailState extends State<CultiveCourceSignDetail>  with SingleTickerProviderStateMixin {


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
      appBar: AppBar(title: Text('签到详情'),),
      body: Container(
        child: _buildBodyWidget()
      ),
    );
  }

  Widget _buildBodyWidget(){
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
//                margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
                  width: ScreenAdaper.width(150),
                  height: ScreenAdaper.width(150),
//                color: Color(0xffFF5B3E),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: LinearGradient(
                        colors:[Color(0xffFF5B3E), Color(0xffFF5B3E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('100',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(38),fontWeight: FontWeight.bold),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('参加总数',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(26)),),
                    ],
                  ),
                ),
                Container(
//                margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
                  width: ScreenAdaper.width(150),
                  height: ScreenAdaper.width(150),
//                color: Color(0xffFF5B3E),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: LinearGradient(
                        colors:[Color(0xffFF7D67), Color(0xffFF7D67)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('12',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(38),fontWeight: FontWeight.bold),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('本人签到',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(26)),),
                    ],
                  ),
                ),
                Container(
//                margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
                  width: ScreenAdaper.width(150),
                  height: ScreenAdaper.width(150),
//                color: Color(0xffFF5B3E),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: LinearGradient(
                        colors:[Color(0xffFF7D67), Color(0xffFF7D67)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('21',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(38),fontWeight: FontWeight.bold),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('代签人数',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(26)),),
                    ],
                  ),
                ),
                Container(
//                margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
                  width: ScreenAdaper.width(150),
                  height: ScreenAdaper.width(150),
//                color: Color(0xffFF5B3E),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: LinearGradient(
                        colors:[Color(0xffFF7D67), Color(0xffFF7D67)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('8',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(38),fontWeight: FontWeight.bold),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('未签人数',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(26)),),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(ScreenAdaper.width(30)),
          ),
          Container(
            color: Colors.white,
            height: ScreenAdaper.height(110),
            child: TabBar(controller: _tabController, tabs: [
              Tab(text: "未签人数",),
              Tab(text: "代签人数",),
              Tab(text: "本人签到",),
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
            height: ScreenAdaper.height(810),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CultiveCourceSignDetailChildWidget(),
                CultiveCourceSignDetailChildWidget(),
                CultiveCourceSignDetailChildWidget(),
              ],
            ),
          )
        ],

      ),
    );
  }
}
