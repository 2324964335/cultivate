import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class CultiveDetail extends StatefulWidget {
  CultiveDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CultiveDetailState createState() => _CultiveDetailState();
}

class _CultiveDetailState extends State<CultiveDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('培训详情',style: TextStyle(color: Colors.black45),),
      ),
      body: Container(
        child: Text('培训详情页面'),
      ),
    );
  }
}
