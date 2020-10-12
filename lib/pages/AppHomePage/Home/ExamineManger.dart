import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/Calendar/flutter_custom_calendar.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
class ExamineManger extends StatefulWidget {
  ExamineManger({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExamineMangerState createState() => _ExamineMangerState();
}

class _ExamineMangerState extends State<ExamineManger> {

  CalendarController controller;
  CalendarViewWidget calendar;
  HashSet<DateTime> _selectedDate = new HashSet();
  HashSet<DateModel> _selectedModels = new HashSet();

  GlobalKey<CalendarContainerState> _globalKey = new GlobalKey();
  bool _isMonthSelected = false;
  String _selectDate = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _selectedDate.add(DateTime.now());
    controller = new CalendarController(
        minYear: 2019,
        minYearMonth: 1,
        maxYear: 2021,
        maxYearMonth: 12,
        showMode: CalendarConstants.MODE_SHOW_WEEK_AND_MONTH,
        selectedDateTimeList: _selectedDate,
        selectMode: CalendarSelectedMode.singleSelect)
      ..addOnCalendarSelectListener((dateModel) {
        _selectedModels.add(dateModel);
        setState(() {
          _selectDate = _selectedModels.toString();
        });
      })
      ..addOnCalendarUnSelectListener((dateModel) {
//        LogUtil.log(TAG: '_selectedModels', message: _selectedModels.toString());
//        LogUtil.log(TAG: 'dateModel', message: dateModel.toString());
        if (_selectedModels.contains(dateModel)) {
          _selectedModels.remove(dateModel);
        }
        setState(() {
          _selectDate = '';
        });
      });
    calendar = new CalendarViewWidget(
      key: _globalKey,
      calendarController: controller,
      verticalSpacing:0,
      dayWidgetBuilder: (DateModel model) {
        bool _isSelected = model.isSelected;
        if (_isSelected &&
            CalendarSelectedMode.singleSelect ==
                controller.calendarConfiguration.selectMode) {
          _selectDate = model.toString();
        }
        return Container(
          padding: EdgeInsets.all(ScreenAdaper.width(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(ScreenAdaper.width(5)),
            child: Container(
              color: _isSelected ? Color(0xffFF5B3E) : Colors.white,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    model.day.toString(),
                    style: TextStyle(
                        color: model.isCurrentMonth
                            ? (_isSelected == false
                            ? (model.isWeekend
                            ? Colors.black38
                            : Colors.black87)
                            : Colors.white)
                            : Colors.black38),
                  ),
//              Text(model.lunarDay.toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addExpandChangeListener((value) {
        /// 添加改变 月视图和 周视图的监听
        _isMonthSelected = value;
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('培训管理'),),
      body: Container(
        color: Colors.white,
        child:  ListView.builder(
            itemCount: 30,
            itemBuilder: (ctx, index) {
              return _buildItemByIndex(context,index);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset("asset/images/home/richengjia.png",width: ScreenAdaper.width(100),height:ScreenAdaper.width(100),),
        backgroundColor:Colors.transparent,
        onPressed: (){
          LogUtil.d('-----');
          Navigator.pushNamed(
            context,
            '/addCultivatePlan',
            arguments: {}, //　传递参数
          );
        },
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildHeaderItem(context, index);
    }else{
      return _buildItem(context, index);
    }
  }

  Widget _calendarTool(){
    return GestureDetector(
      child: Container(
        width: ScreenAdaper.width(750),
        height: ScreenAdaper.width(55),
        color: Colors.white,
        alignment: Alignment.center,
        child: Image.asset(_isMonthSelected==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(40),height:ScreenAdaper.width(40),),
      ),
      onTap: (){
        if(_isMonthSelected){
          setState(() {
            controller.weekAndMonthViewChange(
                CalendarConstants.MODE_SHOW_ONLY_MONTH);
          });
        }else{
          setState(() {
            controller.weekAndMonthViewChange(
                CalendarConstants.MODE_SHOW_ONLY_WEEK);
          });
        }
      },
    );
  }

  Widget _buildHeaderItem(BuildContext context,int index){
    return Container(
//      height: _isMonthSelected==true?ScreenAdaper.width(850):ScreenAdaper.width(350),
      child:
//      CupertinoScrollbar(
//        child: CustomScrollView(
//          slivers: <Widget>[
////            _topButtons(),
//            _topMonths(),
//            SliverToBoxAdapter(
//              child: calendar,
//            ),
////            SliverToBoxAdapter(
////              child: Container(
////                child: Text(
////                  ' $_selectDate ',
////                  style: TextStyle(color: Theme.of(context).focusColor),
////                ),
////              ),
////            )
//          ],
//        ),
//      ),
      Column(
        children: [
          _buildTop(),
          _titleWidget(),
          calendar,
          _calendarTool(),
          Container(
            width: ScreenAdaper.screenW (context),
            height: ScreenAdaper.width(10),
            color: Color(0xffFCFCFC),
          ),
          Container(
            alignment: Alignment.center,
            height: ScreenAdaper.width(70),
            width: ScreenAdaper.screenW(context),
            child: Text('08月31日 周五',style: TextStyle(color: Color(0xffFF5B3E),fontSize: ScreenAdaper.sp(35)),),
          ),
        ],
      ),
    );
  }

  Widget _buildTop(){
    return Container(
      margin: EdgeInsets.all(ScreenAdaper.width(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              width: ScreenAdaper.width(345),
              height: ScreenAdaper.height(170),
              child: Image.asset("asset/images/home/caozuokaoshi.png",fit: BoxFit.fitWidth,),
            ),
            onTap: (){
//              Navigator.pushNamed(
//                context,
//                '/ExamineManger',
//                arguments: {},
//              );
            },
          ),
          GestureDetector(
            child: Container(
              width: ScreenAdaper.width(345),
              height: ScreenAdaper.height(170),
              child: Image.asset("asset/images/home/lilunkaoshi.png",fit: BoxFit.fitWidth,),
            ),
            onTap: (){
//              Navigator.pushNamed(
//                context,
//                '/ExamineManger',
//                arguments: {},
//              );
            },
          ),
        ],
      ),
    );
  }

  Widget _titleWidget(){
    return Container(
        margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
                  alignment: Alignment.center,
                  child: DarkText.build('培训计划'),
                ),
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                  color: Color(0xFFF1B900),

                  padding: EdgeInsets.all(ScreenAdaper.width(10)),
                  child: Text("返回今天",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                ),
              ],
            ),
            Line.build(),
          ],
        )
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Container(
          margin: EdgeInsets.all(ScreenAdaper.width(15)),
          width: ScreenAdaper.width(750),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdaper.width(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LightText.build('下午13:20'),
                        Container(
                          margin: EdgeInsets.only(left: ScreenAdaper.width(10),right: ScreenAdaper.width(10)),
                          child: new ClipRRect(
                            borderRadius: BorderRadius.circular(ScreenAdaper.width(5)),
                            child:Container(
                              width: ScreenAdaper.width(10),
                              height: ScreenAdaper.width(10),
                              color: Color(0xff00D08D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(10),),
                        width: ScreenAdaper.width(110),
                        height: ScreenAdaper.width(110),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            gradient: LinearGradient(
                              colors: index%2==1?[Color(0xFFFF9177), Color(0xFFF64640)]:[Color(0xFFCECCCC), Color(0xFFCECCCC)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('满分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
                            SizedBox(height: ScreenAdaper.height(1),),
                            Text('100分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(16)),
                                child: Text('2020年跨科室晋级..',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(27)),),
                              ),
                              SizedBox(width: ScreenAdaper.width(55),),
                              Container(
                                margin: EdgeInsets.only(top: ScreenAdaper.height(16)),

                                color: index%2==0?Color(0xFF00D08D):Color(0xFFCECCCC),

                                padding: EdgeInsets.all(ScreenAdaper.width(10)),
                                child: Text(index%2==1?"未开始":"已结束",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                            color: Colors.black26,
                            height: ScreenAdaper.height(1),
                            width: ScreenAdaper.width(400),
                          ),
                          SizedBox(height: ScreenAdaper.width(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
//                              SizedBox(width: ScreenAdaper.width(20),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('开始时间:',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(20)),),
                                  SizedBox(height: ScreenAdaper.width(10),),
                                  Text('结束时间',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(20)),),
                                ],
                              ),
                              SizedBox(width: ScreenAdaper.width(20),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                  SizedBox(height: ScreenAdaper.width(10),),
                                  Text('2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: ScreenAdaper.width(10),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenAdaper.width(20),),
              Line.build()
            ],
          )
      ),
    );
  }
}
