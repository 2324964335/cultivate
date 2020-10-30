import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_request/HomeRequest.dart';
class QuestionWrongTotalSelect extends StatefulWidget {
  QuestionWrongTotalSelect({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _QuestionWrongTotalSelectState createState() => _QuestionWrongTotalSelectState();
}

class _QuestionWrongTotalSelectState extends State<QuestionWrongTotalSelect> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    Map params = {
//      "id":this.widget.params['id']
//    };
//    HomeRequest.requestCurrentMonthExaminPersonList(StorageUtil().getSureUserModel().TokenID, params).then((value){
//
//    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('模拟错题库'),),
      body: Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (ctx,index){
              return _buildItem(context,index);
            }),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: ScreenAdaper.width(20),),
//                        ClipOval(
//                          child: Container(
//                            color: Colors.lightBlueAccent,
//                            width: ScreenAdaper.width(90),
//                            height: ScreenAdaper.width(90),
//                          ),
//                        ),
//                        Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(90),height:ScreenAdaper.width(90),),

                        SizedBox(width: ScreenAdaper.width(15),),
                        Container(
                          margin: EdgeInsets.only(top: ScreenAdaper.width(20)),
                          height: ScreenAdaper.width(50),
                          child: Text("${index + 1}"+".刘医生的电脑上看就看电视\\题库",style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                        )
//                        SizedBox(width: ScreenAdaper.width(15),),
//                        Text("无菌技术组",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                      child:Text("202/300",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
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
        ),
        onTap: (){
          Navigator.pushNamed(
            context,
            '/answerQuestion',
            arguments: {}, //　传递参数
          );

        },
      ),
    );
  }
}
