import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
class TheoryExamineQuestionDetailChild extends StatefulWidget {
  @override
  _TheoryExamineQuestionDetailChildState createState() => _TheoryExamineQuestionDetailChildState();
}

class _TheoryExamineQuestionDetailChildState extends State<TheoryExamineQuestionDetailChild> {

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${index + 1}'+'.发挥药效最快的给药途径是什么？',style: TextStyle(color: Color(0xff606266),fontSize: ScreenAdaper.sp(34)),),
            SizedBox(height: ScreenAdaper.width(10),),
            LightText.buildColor('A.口服'+'${index + 1}',Color(0xff00D08D)),
            SizedBox(height: ScreenAdaper.width(10),),
            LightText.buildColor('B.皮下注射'+'${index + 1}',Color(0xffFF5B3E)),
            SizedBox(height: ScreenAdaper.width(10),),
            LightText.build('C.吸入疗法'+'${index + 1}'),
            SizedBox(height: ScreenAdaper.width(10),),
            LightText.build('D.静脉注射'+'${index + 1}'),
            SizedBox(height: ScreenAdaper.width(10),),
          ],
        )
    );
  }
}
