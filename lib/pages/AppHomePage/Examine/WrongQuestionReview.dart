import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class WrongQuestionReview extends StatefulWidget {
  WrongQuestionReview({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _WrongQuestionReviewState createState() => _WrongQuestionReviewState();
}

class _WrongQuestionReviewState extends State<WrongQuestionReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('错题巩固'),),
      body: Container(
        color: Colors.white,
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
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.width(10),bottom: ScreenAdaper.width(10)),
              width: ScreenAdaper.width(340),
              height: ScreenAdaper.width(340),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/images/examine/cuotiBG.png"),
                  fit: BoxFit.cover,
                ),
              ),
//          color: Colors.transparent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('150',style: TextStyle(color: Color(0xffE5490B),fontSize: ScreenAdaper.sp(70)),),
//                  SizedBox(height: ScreenAdaper.width(10),),
                  Text('错题数',style: TextStyle(color: Color(0xffF37502),fontSize: ScreenAdaper.sp(25)),),
                ],
              ),
            ),
            Container(
              height: ScreenAdaper.width(200),
              margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
              padding: EdgeInsets.all(ScreenAdaper.width(40)),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('30',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(60)),),
                          LightText.build('单选题'),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: Color(0xffDDDDDD),
                    width: ScreenAdaper.width(1),
                    height: ScreenAdaper.width(100),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('70',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(60)),),
                          LightText.build('多选题'),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: Color(0xffDDDDDD),
                    width: ScreenAdaper.width(1),
                    height: ScreenAdaper.width(100),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('44',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(60)),),
                          LightText.build('判断题'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: ScreenAdaper.width(100)),
                width: ScreenAdaper.width(400),
                height: ScreenAdaper.width(180),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/images/home/cuotihuigu.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center, 
                child:Text('错题回顾',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(40)),),
              ),
              onTap: (){
                  Navigator.pushNamed(
                    context,
                    '/answerQuestion',
                    arguments: {}, //　传递参数
                  );


              },
            ),
          ],
      )
    );
  }
}
