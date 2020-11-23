import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class WorkingMessage extends StatefulWidget {
  WorkingMessage({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _WorkingMessageState createState() => _WorkingMessageState();
}

class _WorkingMessageState extends State<WorkingMessage> {
  List _titleArr = ["工号","能级","","职位","职称","所属病区","所属科室"];
  List _subTitleArr = [StorageUtil().getSureUserModel().WorkNo,"N2","","护士","高级护士","南九病区","儿科"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('工作信息'),),
      body: Container(
        child: ListView.builder(
            itemCount: _titleArr.length,
            itemBuilder: (ctx,index){
              return _buildItem(context,index);
            }),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    if(_titleArr[index] == ""){
      return Container(
        height: ScreenAdaper.height(15),
        color: Color(0xfffcfcfc),
        width: ScreenAdaper.screenWidth(),
      );
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Column(
        children: [
          SizedBox(height: ScreenAdaper.width(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
//              Text(_titleArr[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
//              Text(_subTitleArr[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
              Container(
                child:Text(_titleArr[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
              ),
              Container(
                child: Text(_subTitleArr[index],style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
              )
            ],
          ),
          SizedBox(height: ScreenAdaper.width(30),),
          Container(
            margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
            color: Color(0xffe7e7e7),
            height:ScreenAdaper.height(1.5),
            width: ScreenAdaper.width(700),
          ),
        ],
      )
    );
  }
}
