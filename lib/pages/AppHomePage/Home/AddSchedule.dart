import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/text_field.dart';
class AddSchedule extends StatefulWidget {
  AddSchedule({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  //用于焦点
  final FocusNode _inputNode = FocusNode();
  TextEditingController _inputController = TextEditingController();

  bool isAllDay = true;
  @override
  void dispose() {
    // TODO: implement dispose
    _inputController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('添加日程'),),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:   ListView.builder(
              itemCount: 6,
              itemBuilder: (ctx, index) {
                return _buildItemByIndex(context,index);
              }
          )
      )
    );
  }

  Widget _buildInputItem(BuildContext context,int index){
    return Container(
        margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),

        child: Column(
        children: [
          Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('内容:',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(36),fontWeight: FontWeight.bold),),
              SizedBox(width: ScreenAdaper.width(10),),
              Container(
                width: ScreenAdaper.width(450),
                height: ScreenAdaper.width(250),
                child:MyTextField(
                  focusNode: _inputNode,
                  placeHolder: '发布属于你的日程',
                  maxLength: null,
                  noBottomLine: true,
                  keyboardType: TextInputType.multiline,
                  controller: _inputController,
                  isMultiHang: false,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(15),),

          Container(
            height: ScreenAdaper.height(10),
            width: ScreenAdaper.screenW(context),
            color: Colors.white,
          ),
        ],
      )
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildInputItem(context, index);
    }else if(index == 1||index == 2){
      return _buildTimeItem(context, index);
    }else if(index == 3){
      return _buildAllDayItem(context, index);
    }else{
      return _buildCommenItem(context, index);
    }
  }

  Widget _buildCommenItem(BuildContext context,int index){
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LightText.build('参与人'),
              Row(
                children: [
                  LightText.build('添加参与人'),
                  Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                ],
              ),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(15),),
          Line.build()
        ],
      ),
    );
  }

  Widget _buildAllDayItem(BuildContext context,int index){
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),

      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              LightText.build('全天'),
              new Switch(
                value: this.isAllDay,
                activeColor: Color(0xff00D08D),     // 激活时原点颜色
                onChanged: (bool val) {
                  this.setState(() {
                    this.isAllDay = !this.isAllDay;
                  });
                },
              )
            ],
          ),
          SizedBox(height: ScreenAdaper.height(15),),

          Line.build()
        ],
      ),
    );
  }

  Widget _buildTimeItem(BuildContext context,int index){
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.width(20),right: ScreenAdaper.width(32),left: ScreenAdaper.width(32),bottom: ScreenAdaper.width(20)),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
                Row(
                  children: [
                      LightText.build('开始时间：'),
                    DarkText.build('2020年8月20日 14:20'),
                  ],
                ),
              Image.asset("asset/images/home/faburili.png",width: ScreenAdaper.width(40),height:ScreenAdaper.width(40),),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(15),),

          Line.build()
        ],
      ),
    );
  }
}
