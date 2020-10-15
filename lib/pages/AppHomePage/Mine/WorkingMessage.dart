import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class WorkingMessage extends StatefulWidget {
  WorkingMessage({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _WorkingMessageState createState() => _WorkingMessageState();
}

class _WorkingMessageState extends State<WorkingMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('工作信息'),),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx,index){
              return _buildItem();
            }),
      ),
    );
  }

  Widget _buildItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Text('工作信息页面需求待定')
    );
  }
}
