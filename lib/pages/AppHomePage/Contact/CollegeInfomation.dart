import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import './contact_request/contact_list_entity.dart';
class CollegeInfomation extends StatefulWidget {
  CollegeInfomation({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _CollegeInfomationState createState() => _CollegeInfomationState();
}

class _CollegeInfomationState extends State<CollegeInfomation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text((this.widget.params["info"] as ContactListDataListEmpInfoItem).name),),
      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx, index){
            return _buildItemByIndex(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    ContactListDataListEmpInfoItem item = this.widget.params["info"];
    if(index == 0){
      return GestureDetector(
        child: Container(
          color: Colors.white,
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdaper.width(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("asset/images/mine/touxiangpre.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Text('个人头像',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                      ],
                    ),
                    Row(
                      children: [
                        CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
//                        SizedBox(width: ScreenAdaper.width(10),),
//                        Image.asset("asset/images/contact/jianttou.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                color: Color(0xffe7e7e7),
                height:ScreenAdaper.height(1.5),
                width: ScreenAdaper.width(700),
              ),
            ],
          ),
        ),
        onTap: (){
        },
      );
    }else{
      /*
                Navigator.pushNamed(
                  context,
                  '/changeMobileFirst',
                  arguments: {}, //　传递参数
                );
      */
      return Container(
        child:Column(
          children: [
            GestureDetector(
              child:  Container(
                padding: EdgeInsets.all(ScreenAdaper.width(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(index == 1?"asset/images/mine/xinming.png":"asset/images/mine/shouji.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
                        SizedBox(width: ScreenAdaper.width(10),),
                        Text(index == 1?'姓名':'手机号',style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                      ],
                    ),
                    Row(
                      children: [
                        Text(index == 1?(item.name):item.tell,style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(28)),),
                        SizedBox(width: ScreenAdaper.width(10),),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
              color: Color(0xffe7e7e7),
              height:ScreenAdaper.height(1.5),
              width: ScreenAdaper.width(700),
            ),
          ],
        ),
      );
    }
  }
}
