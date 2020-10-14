import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class ExaminePersonListResult extends StatefulWidget {
  ExaminePersonListResult({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonListResultState createState() => _ExaminePersonListResultState();
}

class _ExaminePersonListResultState extends State<ExaminePersonListResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.params["examineType"] == 2?'成绩查询':'考核人员列表'),),
      body: Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (ctx,index){
              return _buildItem(context, index);
            }),
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
                    color: Color(0xfff5f5f5),
                    offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
                width: ScreenAdaper.width(150),
                height: ScreenAdaper.width(150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    gradient: LinearGradient(
                      colors: index%2==0?[Color(0xFF00D08D), Color(0xFF00D08D)]:[Color(0xFFF1B900), Color(0xFFF1B900)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child:
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Text('满分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
//                    SizedBox(height: ScreenAdaper.height(1),),
//                    Text('100分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
//                  ],
//                ),
                Text('100分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
                alignment: Alignment.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.height(10)),
                    child: Text('李子期',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                  ),
                  SizedBox(height: ScreenAdaper.width(16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: ScreenAdaper.width(20),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('开始时间:',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                          SizedBox(height: ScreenAdaper.width(10),),
                          Text('结束时间',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                        ],
                      ),
                      SizedBox(width: ScreenAdaper.width(20),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                          SizedBox(height: ScreenAdaper.width(10),),
                          Text('2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: ScreenAdaper.width(10),),
                ],
              ),
            ],
          ),
        ),
        onTap: (){
//          if(index == 1){
//            Navigator.pushNamed(
//              context,
//              '/examinePersonListResult',
//              arguments: {}, //　传递参数
//            );
//          }else{
//            Navigator.pushNamed(
//              context,
//              '/examinePersonList',
//              arguments: {}, //　传递参数
//            );
//          }
          if(widget.params["examineType"] == 2){
            Navigator.pushNamed(
              context,
              '/theoryExamineQuestionDetail',
              arguments: {}, //　传递参数
            );
          }else{
            Navigator.pushNamed(
              context,
              '/examinePersonResultDetail',
              arguments: {}, //　传递参数
            );
          }
        }
      ),
    );
  }
}
