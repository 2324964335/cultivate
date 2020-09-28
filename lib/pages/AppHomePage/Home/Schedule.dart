import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/Calendar/flutter_custom_calendar.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
class Schedule extends StatefulWidget {
  Schedule({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

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
      dayWidgetBuilder: (DateModel model) {
        bool _isSelected = model.isSelected;
        if (_isSelected &&
            CalendarSelectedMode.singleSelect ==
                controller.calendarConfiguration.selectMode) {
          _selectDate = model.toString();
        }
        return ClipRRect(
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
      appBar: AppBar(title: Text('日程'),),
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
      height: _isMonthSelected==true?ScreenAdaper.width(1050):ScreenAdaper.width(350),
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
            calendar,
            _calendarTool()
          ],

        ),
    );
  }

  Widget _topButtons() {
    return SliverToBoxAdapter(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          Text('请选择mode'),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              FlatButton(
                child: Text(
                  '单选',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    controller.calendarConfiguration.selectMode =
                        CalendarSelectedMode.singleSelect;
                  });
                },
                color: controller.calendarConfiguration.selectMode ==
                    CalendarSelectedMode.singleSelect
                    ? Colors.teal
                    : Colors.black38,
              ),
              FlatButton(
                child: Text(
                  '多选',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    controller.calendarConfiguration.selectMode =
                        CalendarSelectedMode.multiSelect;
                  });
                },
                color: controller.calendarConfiguration.selectMode ==
                    CalendarSelectedMode.multiSelect
                    ? Colors.teal
                    : Colors.black38,
              ),
              FlatButton(
                child: Text(
                  '多选 选择开始和结束',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    controller.calendarConfiguration.selectMode =
                        CalendarSelectedMode.mutltiStartToEndSelect;
                  });
                },
                color: controller.calendarConfiguration.selectMode ==
                    CalendarSelectedMode.mutltiStartToEndSelect
                    ? Colors.teal
                    : Colors.black38,
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _topMonths() {
    return SliverToBoxAdapter(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
//          Text('月视图和周视图'),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              FlatButton(
                child: Text(
                  '月视图',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    controller.weekAndMonthViewChange(
                        CalendarConstants.MODE_SHOW_ONLY_WEEK);
                  });
                },
                color: _isMonthSelected ? Colors.teal : Colors.black38,
              ),
              FlatButton(
                child: Text(
                  '周视图',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    controller.weekAndMonthViewChange(
                        CalendarConstants.MODE_SHOW_ONLY_MONTH);
                  });
                },
                color: _isMonthSelected == false ? Colors.teal : Colors.black38,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: GestureDetector(
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('下午13:20'),
                      new ClipRRect(
                        borderRadius: BorderRadius.circular(ScreenAdaper.width(5)),
                        child:Container(
                              width: ScreenAdaper.width(10),
                              height: ScreenAdaper.width(10),
                              color: Color(0xff00D08D),
                          ),
                      ),
                      Text('提交护理闹报告'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('来自：'),
                      Text('日程提醒'),
                    ],
                  ),
                ],
              ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
              color: Colors.black26,
              height: ScreenAdaper.height(1),
              width: ScreenAdaper.width(680),
            ),
          ],
        ),
        onTap: (){
//          Navigator.pushNamed(
//            context,
//            '/waitEnrollPerson',
//            arguments: {}, //　传递参数
//          );
        LogUtil.d('点击了日程');
        },
      ),
    );
  }
}
