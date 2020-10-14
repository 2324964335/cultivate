import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
class CurrentMonthExamineChildWidget extends StatefulWidget {
  final int index;
  final int examineType;
  CurrentMonthExamineChildWidget(this.index,this.examineType);
  @override
  _CurrentMonthExamineChildWidgetState createState() => _CurrentMonthExamineChildWidgetState();
}

class _CurrentMonthExamineChildWidgetState extends State<CurrentMonthExamineChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView.builder(
          itemCount: 30,
          itemBuilder: (ctx, index) {
            return _buildItem(context,index);
          }
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
                     colors: index%2==0?[Color(0xFFFF9177), Color(0xFFF64640)]:[Color(0xFFCECCCC), Color(0xFFCECCCC)],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                   )),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('满分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
                    SizedBox(height: ScreenAdaper.height(1),),
                    Text('100分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
                  ],
               ),
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       alignment: Alignment.centerLeft,
                       margin: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(16)),
                       child: Text('2020年跨科室晋级操作考',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                     ),
                     SizedBox(width: ScreenAdaper.width(75),),
                     Container(
                       margin: EdgeInsets.only(top: ScreenAdaper.height(16)),

                       color: index%2==0?Color(0xFF00D08D):Color(0xFFCECCCC),

                       padding: EdgeInsets.all(ScreenAdaper.width(10)),
                       child: Text(index%2==0?"未开始":"已结束",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                     ),
                   ],
                 ),
                 Container(
                   margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                   color: Colors.black26,
                   height: ScreenAdaper.height(1),
                   width: ScreenAdaper.width(510),
                 ),
                 SizedBox(height: ScreenAdaper.width(10),),
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
          if(widget.index == 1){
            if(widget.examineType== 2){
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":2}, //　传递参数
              );
            }else if(widget.examineType== 1){
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":1}, //　传递参数
              );
            }
            else{
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":0}, //　传递参数
              );
            }//　传递参数

          }else{
            if(widget.examineType== 2){
              Navigator.pushNamed(
                context,
                '/theoryExamineQuestion',
                arguments: {}, //　传递参数
              );
            }else{
              Navigator.pushNamed(
                context,
                '/examinePersonList',
                arguments: {}, //　传递参数
              );
            }
          }
          ///ExaminePersonListResult
        },
      ),
    );
  }
}
