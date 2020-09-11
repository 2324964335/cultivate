import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class CourseSignSuccess extends StatefulWidget {
  CourseSignSuccess({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CourseSignSuccessState createState() => _CourseSignSuccessState();
}

class _CourseSignSuccessState extends State<CourseSignSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('签到',style: TextStyle(color: Colors.black54),),
      ),
      body: Stack(
        children: [
          Positioned(
              child:
              Container(
                margin: EdgeInsets.only(top: ScreenAdaper.width(200)),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset("asset/images/home/signsuccess.png",width: ScreenAdaper.width(240),height: ScreenAdaper.width(240),),
                    SizedBox(height: ScreenAdaper.height(25),),
                    Text('签到成功',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(35)),),
                  ],
                )
              ),
              left: 0,
              bottom: ScreenAdaper.height(201),
              right: 0,
              top: 0),
          Positioned(
            child: _buildBottomTool(),
            left: 0,
            bottom: 0,),
        ],
        alignment: Alignment.center,
      )
    );
  }


  Widget _buildBottomTool(){
    return Container(
//      margin: EdgeInsets.only(left: 0,right: 0),
        color: Colors.transparent,
        width: ScreenAdaper.width(745),
        height: ScreenAdaper.height(200),
        alignment: Alignment.center,
        child: GestureDetector(
          child:
          new ClipRRect(

            borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
            child:
            Container(
              height: ScreenAdaper.width(90),
              width: ScreenAdaper.width(640),
              alignment: Alignment.center,
              color: Color(0xFF00D08D),
              child: Text("返回培训详情",style: TextStyle(color: Colors.white),),
            ),
          ),
          onTap: (){

          },
        )
    );
  }

}
