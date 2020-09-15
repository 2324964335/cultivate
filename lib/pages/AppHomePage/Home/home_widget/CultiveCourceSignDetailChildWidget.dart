import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
class CultiveCourceSignDetailChildWidget extends StatefulWidget {
  @override
  _CultiveCourceSignDetailChildWidgetState createState() => _CultiveCourceSignDetailChildWidgetState();
}

class _CultiveCourceSignDetailChildWidgetState extends State<CultiveCourceSignDetailChildWidget> {

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
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: GestureDetector(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: ScreenAdaper.width(20),),

                      ClipOval(
                        child: Container(
                          color: Colors.lightBlueAccent,
                          width: ScreenAdaper.width(90),
                          height: ScreenAdaper.width(90),
                        ),
                      ),
                      SizedBox(width: ScreenAdaper.width(15),),
                      Text("王舒服",style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                    child:Text("签到时间：今天14:20",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Container(
              width: ScreenAdaper.width(720),
              height: ScreenAdaper.height(1),
              color: Color(0xffe7e7e7),
            ),
          ],
        ),
        onTap: (){
            Navigator.pushNamed(
              context,
              '/cultiveSignQrcode',
              arguments: {}, //　传递参数
            );

        },
      ),
    );
  }
}
