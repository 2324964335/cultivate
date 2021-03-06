import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class TheoreticalModeling extends StatefulWidget {
  TheoreticalModeling({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _TheoreticalModelingState createState() => _TheoreticalModelingState();
}

class _TheoreticalModelingState extends State<TheoreticalModeling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('理论模拟'),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/home/lilunmoniBG.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (ctx,index){
              return _buildItem(context,index);
            }),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: ScreenAdaper.height(210),left: ScreenAdaper.width(140),right: ScreenAdaper.width(140)),
      child: GestureDetector(
        child: Container(
          height: ScreenAdaper.width(200),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(index == 0?"asset/images/home/shunxulianxi.png":"asset/images/home/cuotihuigu.png"),
              fit: BoxFit.cover,
            ),
          ),
//          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index == 0?'模拟题库':'错题回顾',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(40)),),
//              index ==0? SizedBox(height: ScreenAdaper.width(14),):Container(),
//              index ==0? Text('0/2000',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(26)),):Container(),
            ],
          ),
        ),
        onTap: (){
          ///WrongQuestionReview
          if(index == 0){
            ///questionTotalSelect
            Navigator.pushNamed(
              context,
              '/questionTotalSelect',
              arguments: {}, //　传递参数
            );
//            Navigator.pushNamed(
//              context,
//              '/answerQuestion',
//              arguments: {}, //　传递参数
//            );
          }else{
            Navigator.pushNamed(
              context,
              '/questionWrongTotalSelect',
              arguments: {}, //　传递参数
            );
//            Navigator.pushNamed(
//              context,
//              '/wrongQuestionReview',
//              arguments: {}, //　传递参数
//            );
          }

        },
      ),
    );
  }
}
