import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class ExaminePersonList extends StatefulWidget {
  ExaminePersonList({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonListState createState() => _ExaminePersonListState();
}

class _ExaminePersonListState extends State<ExaminePersonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('考核人员列表'),),
      body: Container(
        child: ListView.builder(
          itemCount: 100,
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
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: ScreenAdaper.width(20),),

                        ClipOval(
                          child: Container(
                            color: Colors.lightBlueAccent,
                            width: ScreenAdaper.width(90),
                            height: ScreenAdaper.width(90),
                          ),
                        ),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text("刘医生",style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text("无菌技术组",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                      child:Text("2020-07-20 14:20",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenAdaper.height(20),),
              Container(
                width: ScreenAdaper.width(720),
                height: ScreenAdaper.height(1),
                color: Color(0xffe7e7e7),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.pushNamed(
            context,
            '/cultiveSignQrcode',
            arguments: {}, //　传递参数
          );

        },
      ),
    );
  }
}
