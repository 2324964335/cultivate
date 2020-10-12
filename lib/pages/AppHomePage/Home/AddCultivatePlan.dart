import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/text_field.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';
class AddCultivatePlan extends StatefulWidget {
  AddCultivatePlan({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AddCultivatePlanState createState() => _AddCultivatePlanState();
}

class _AddCultivatePlanState extends State<AddCultivatePlan> {
  //用于焦点
  final FocusNode _inputNode = FocusNode();
  TextEditingController _inputController = TextEditingController();
  final FocusNode _titleInputNode = FocusNode();
  TextEditingController _titleInputController = TextEditingController();

  bool isAllDay = true;

  DateTime date;

  String startDateStr;
  String endDateStr;
  String signStartDateStr;
  String baomingEndDateStr;
  bool isClickStartTime = false;
  int timeClickIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = new DateTime.now();
    startDateStr = MyDate.format("yyyy年MM月dd日 HH:mm", date);
    endDateStr = MyDate.format("yyyy年MM月dd日 HH:mm", date);
    signStartDateStr = MyDate.format("yyyy年MM月dd日 HH:mm", date);
    baomingEndDateStr = MyDate.format("yyyy年MM月dd日 HH:mm", date);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _inputController.dispose();
   _titleInputController.dispose();

    super.dispose();
  }

  _change(formatString) {
    return (_date) {
//      print(MyDate.format(formatString, _date));
      setState(() {
        date = _date;
//        if(this.isClickStartTime){
//          startDateStr = MyDate.format(formatString, _date);
//        }else{
//          endDateStr = MyDate.format(formatString, _date);
//        }
        switch (timeClickIndex){
          case 4:
            startDateStr = MyDate.format(formatString, _date);
          break;
          case 5:
            endDateStr = MyDate.format(formatString, _date);
            break;
          case 6:
            signStartDateStr = MyDate.format(formatString, _date);
            break;
          case 7:
            baomingEndDateStr = MyDate.format(formatString, _date);
            break;
          default:

        }
      });
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新增培训计划'),
          actions: <Widget>[
            IconButton(
              icon: Text('提交',style: TextStyle(color: Color(0xff00D08D)),),
              tooltip: 'Search',
              onPressed: (){
                ToastShow.show("培训发布成功");
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 13,
                  itemBuilder: (ctx, index) {
                    return _buildItemByIndex(context,index);
                  }
              ),
            )
        )
    );
  }

  Widget _buildTitleInputItem(BuildContext context,int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LightText.build('标题：'),
              Container(
//                padding: EdgeInsets.only(top: ScreenAdaper.width(20)),
                width: ScreenAdaper.width(450),
                height: ScreenAdaper.width(90),
                child: MyTextField(
                  focusNode: _titleInputNode,
                  placeHolder: '请输入标题',
                  maxLength: null,
                  noBottomLine: true,
                  keyboardType: TextInputType.multiline,
                  controller: _titleInputController,
                  isMultiHang: false,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(15),),
          Line.build()
        ],
      ),
    );
  }

  Widget _buildInputItem(BuildContext context,int index){
    return Container(
        margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LightText.build('培训内容：'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),///圆角
                  border: Border.all(color: Color(0xff979797),width: ScreenAdaper.width(0.6))///边框颜色、宽
              ),
              width: ScreenAdaper.width(700),
              margin: EdgeInsets.only(left: ScreenAdaper.width(6),top: ScreenAdaper.width(20),right: ScreenAdaper.width(10),bottom: ScreenAdaper.width(20)),
              padding: EdgeInsets.all(ScreenAdaper.width(10)),
              height: ScreenAdaper.width(200),
              child:MyTextField(
                focusNode: _inputNode,
                placeHolder: '发布培训内容',
                maxLength: null,
                noBottomLine: true,
                keyboardType: TextInputType.multiline,
                controller: _inputController,
                isMultiHang: false,
              ),
            ),
            SizedBox(height: ScreenAdaper.height(15),),
            Line.build()
          ],
        )
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 3){
      return _buildInputItem(context, index);
    }else if(index == 2){
      return _buildTitleInputItem(context, index);
    }
    else if(index == 4||index == 5||index == 6||index == 7){
      return _buildTimeItem(context, index);
    }else{
      return _buildCommenItem(context, index);
    }
  }

  Widget _buildCommenItem(BuildContext context,int index){
    String title = '';
    switch (index){
      case 0:
        title = '类别';
        break;
      case 1:
        title = '课程类型';
        break;
      case 8:
        title = '培训地点';
        break;
      case 9:
        title = '培训讲师';
        break;
      case 10:
        title = '学时';
        break;
      case 11:
        title = '报名上限人数';
        break;
      case 12:
        title = '培训对象';
        break;
      default:
        title = '';
    }
    return GestureDetector(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LightText.build(title),
                Row(
                  children: [
//                    LightText.build(index == 4?'添加参与人':'无提醒'),
                    Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                  ],
                ),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(15),),
            Line.build()
          ],
        ),
      ),
      onTap: (){
        if(index == 5){
          Navigator.pushNamed(
            context,
            '/addScheduleRemind',
            arguments: {}, //　传递参数
          );
        }else{
          ///SelectTotalRecivePerson
          Navigator.pushNamed(
            context,
            '/selectTotalRecivePerson',
            arguments: {}, //　传递参数
          );
        }
      },
    );
  }


  Widget _buildTimeItem(BuildContext context,int index){
    String title = '';
    String time_str = '';
    switch (index){
      case 4:
        title = '开始时间：';
        time_str = startDateStr;
        break;
      case 5:
        title = '结束时间：';
        time_str = endDateStr;

        break;
      case 6:
        title = '签到开始时间：';
        time_str = signStartDateStr;

        break;
      case 7:
        title = '报名截止时间：';
        time_str = baomingEndDateStr;

        break;
      default:
        title = '';
        time_str = '';
    }
    return GestureDetector(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    LightText.build(title),
                    DarkText.build(time_str),
                  ],
                ),
                Image.asset("asset/images/home/faburili.png",width: ScreenAdaper.width(40),height:ScreenAdaper.width(40),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(15),),

            Line.build()
          ],
        ),
      ),
      onTap: (){
        MyPicker.showPicker(
          context: context,
          current: date,
          mode: MyPickerMode.dateTime,
          onChange: _change('yyyy年MM月dd日 HH:mm'),
        );
        timeClickIndex = index;
      },
    );
  }
}
