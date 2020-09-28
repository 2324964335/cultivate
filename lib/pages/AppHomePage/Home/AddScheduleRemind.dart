import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class AddScheduleRemind extends StatefulWidget {
  AddScheduleRemind({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AddScheduleRemindState createState() => _AddScheduleRemindState();
}

class _AddScheduleRemindState extends State<AddScheduleRemind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日程提醒'),
        actions: <Widget>[
          IconButton(
            icon: Text('完成',style: TextStyle(color: Color(0xff00D08D)),),
            tooltip: 'Search',
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx,index){
              return _buildItemByIndex(context, index);
            }),
      ),
    );
  }
  
  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildItem(context, index, '当天（9:00）');
    }else if(index == 1){
      return _buildItem(context, index, '1天前');

    }else if(index == 2){
      return _buildItem(context, index, '2天前');

    }else{
      return _buildTypeItem(context, index);
    }
  }
  
  Widget _buildTypeItem(BuildContext context,int index){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              DarkText.build('提醒方式'),

            ],
          ),
          Container(
            color: Colors.white,
            height: ScreenAdaper.height(10),
            width: ScreenAdaper.screenW(context),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index,String text){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            LightText.build(text),
            Line.build()
          ],
        ),
      ),
    );
  }
}
