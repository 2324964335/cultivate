import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class ExaminePersonResultDetail extends StatefulWidget {
  ExaminePersonResultDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonResultDetailState createState() => _ExaminePersonResultDetailState();
}

class _ExaminePersonResultDetailState extends State<ExaminePersonResultDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('扣分详情'),),
      body: Container(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (ctx,index){
            return _buildItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xfff5f5f5),
                      offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                      blurRadius: 1.0, //阴影模糊程度
                      spreadRadius: 1.0 //阴影扩散程度
                  )
                ]),
           child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(20)),
                        child:Row(
                          children: [
                            Text("${index+ 1}."),
                            Text("素质要求"),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenAdaper.height(20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: ScreenAdaper.width(30)),
                            child: Text('仪表大方，素质端庄，语言柔和，恰当',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(25)),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
                            child: Text("-5",style: TextStyle(color: Colors.red,fontSize: ScreenAdaper.sp(26)),
                            ),)
                        ],
                      ),
                      SizedBox(height: ScreenAdaper.height(20),),
                    ],
      ),
          ),
    );
  }
}
