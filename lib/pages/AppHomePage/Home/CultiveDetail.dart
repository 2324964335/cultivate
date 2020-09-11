import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class CultiveDetail extends StatefulWidget {
  CultiveDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CultiveDetailState createState() => _CultiveDetailState();
}

class _CultiveDetailState extends State<CultiveDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('培训详情',style: TextStyle(color: Colors.black45),),
      ),
      body: 
//      Container(
//        child: ListView.builder(
//            itemCount: 1,
//            itemBuilder: (ctx, index) {
//              return _buildItem(context);
//            }
//        ),
//      ),
        Stack(
          children: [
            Positioned(
                child:
                    Container(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (ctx, index) {
                            return _buildItem(context);
                          }
                      ),
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

            borderRadius: BorderRadius.circular(ScreenAdaper.width(50)),
            child:
                Container(
                  height: ScreenAdaper.width(100),
                  width: ScreenAdaper.width(640),
                  alignment: Alignment.center,
                  color: Color(0xFF00D08D),
                  child: Text("去签到",style: TextStyle(color: Colors.white),),
                ),
            ),
        onTap: (){
          LogUtil.d('-------去签到');
          Navigator.pushNamed(
            context,
            '/courseSignSuccess',
            arguments: {}, //　传递参数
          );
        },
      )
    );
  }

  Widget _buildItem(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),top: ScreenAdaper.height(20)),
      child: Container(
        child: Column(
          children: [
              new ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.black12,
                  width: ScreenAdaper.width(700),
                  height: ScreenAdaper.height(230),
                ),
              ),
            SizedBox(height: ScreenAdaper.height(20),),
            Container(
              margin: EdgeInsets.only(left: ScreenAdaper.width(20),),
              alignment: Alignment.centerLeft,
              child: Text('2020执业护士考核指南',style: TextStyle(color: Colors.black,fontSize: ScreenAdaper.sp(37),fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('发布人',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                Text('某某某',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.width(50),),
                Text('发布时间:',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                Text('2020年8月20日',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(70),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('分享',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(28))),
                Text('添加到',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(28))),
                Text('收藏',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(28))),
                Text('关注',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(28))),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Container(
              height: ScreenAdaper.height(0.5),
              color: Colors.black12,
              width: ScreenAdaper.screenWidth(),
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('培训详情',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(32),fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                Text('开始时间',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text('2020年8月20日 14：20',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                Text('讲   师',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text('邓换',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                Text('地  点',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),

                Text('A区6楼会议室2号',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                Text('培训对象',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),

                Text('护理科全员',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                Text('报名人数',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),

                Text('203/300人',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
