import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class CultiveSignQrcode extends StatefulWidget {
  CultiveSignQrcode({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CultiveSignQrcodeState createState() => _CultiveSignQrcodeState();
}

class _CultiveSignQrcodeState extends State<CultiveSignQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('培训签到'),
      ),
      body:
//      Container(
//        child: ListView.builder(
//            itemCount: 1,
//            itemBuilder: (ctx, index) {
//              return _buildBodyItem();
//            }),
//      ),
        Stack(
          children: [
            Positioned(
                child:
                Container(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, index) {
                        return _buildBodyItem();
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

            borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
            child:
            Container(
              height: ScreenAdaper.width(90),
              width: ScreenAdaper.width(640),
              alignment: Alignment.center,
              color: Color(0xFF00D08D),
              child: Text("签到详情",style: TextStyle(color: Colors.white),),
            ),
          ),
          onTap: (){
            LogUtil.d('-------去签到');
            Navigator.pushNamed(
              context,
              '/cultiveCourceSignDetail',
              arguments: {"id":this.widget.params["id"]}, //　传递参数
            );
          },
        )
    );
  }

  Widget _buildBodyItem(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: ScreenAdaper.width(70),right: ScreenAdaper.width(70),top: ScreenAdaper.width(100)),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ScreenAdaper.height(15),),
          Text('2020.8传染病防控',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(40)),),
          SizedBox(height: ScreenAdaper.height(25),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('培训人：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
              Text('某某某',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
//              Image.asset(''),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(35),),

          Container(
            width: ScreenAdaper.width(450),
            height: ScreenAdaper.width(450),
            color: Color(0xFF757575),
          ),
          SizedBox(height: ScreenAdaper.height(55),),

        ],
      ),
    );
  }
}
