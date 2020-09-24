import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class WaitEnrollCultive extends StatefulWidget {
  WaitEnrollCultive({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _WaitEnrollCultiveState createState() => _WaitEnrollCultiveState();
}

class _WaitEnrollCultiveState extends State<WaitEnrollCultive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('待我确认'),),
      body: Container(
        child:  ListView.builder(
            itemCount: 30,
            itemBuilder: (ctx, index) {
              return _buildItem(context,index);
            }
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                    child: Text('2020年执业护士考核指南',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                    color: Color(0xFFFF5B3E),

                    padding: EdgeInsets.all(ScreenAdaper.width(10)),
                    child: Text("报名审核",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                color: Colors.black26,
                height: ScreenAdaper.height(1),
                width: ScreenAdaper.width(680),
              ),
              SizedBox(height: ScreenAdaper.width(10),),
              Row(
                children: [
                  SizedBox(width: ScreenAdaper.width(20),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('主讲人：某某某',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('地点：A区6楼会议室',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                    ],
                  ),
                  SizedBox(width: ScreenAdaper.width(20),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('开始时间：2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('报名人数：203人',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                    ],
                  )
                ],
              ),
              SizedBox(height: ScreenAdaper.width(10),),
            ],
          ),
        ),
        onTap: (){
            Navigator.pushNamed(
              context,
              '/waitEnrollPerson',
              arguments: {}, //　传递参数
            );

        },
      ),
    );
  }
}
