import '../../../utils/util.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key key, this.params}) : super(key: key);
  final params;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('消息',style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return _buildMessageItem(context);
        }),
    );
  }

  Widget _buildMessageItem(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: ScreenAdaper.width(40),top: ScreenAdaper.width(20),right: ScreenAdaper.width(40)),
      child: Column(
       children: [
         Row(
           children: [
             ClipOval(
               child: Container(
                 color: Colors.lightBlueAccent,
                 width: ScreenAdaper.width(90),
                 height: ScreenAdaper.width(90),
               ),
             ),
             SizedBox(width: ScreenAdaper.width(20),),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   alignment: Alignment.centerLeft,
                   child: Text('关于2020年的考试通知',style: TextStyle(color: Color(0xFF565656),fontSize: ScreenAdaper.sp(28)),),
                 ),
                 Container(
                   width: ScreenAdaper.width(560),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('某某某',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(24)),),
                       Text('2020-07-20 14:20',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(24)),),
                     ],
                   ),
                 ),
               ],
             ),
           ],
         ),
         Container(
           margin: EdgeInsets.only(top: ScreenAdaper.height(18)),
           color: Color(0xffe7e7e7),
           height: ScreenAdaper.height(1),
           width: ScreenAdaper.width(680),
         ),
       ],
      ),
    );
  }
}
