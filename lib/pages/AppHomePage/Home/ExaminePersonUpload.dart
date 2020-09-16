import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class ExaminePersonUpload extends StatefulWidget {
  ExaminePersonUpload({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonUploadState createState() => _ExaminePersonUploadState();
}

class _ExaminePersonUploadState extends State<ExaminePersonUpload> {

  List _dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('刘医生'),
      ),
      body: Stack(
        children: [
          Positioned(
              child:
              Container(
                child: ListView.builder(
                    itemCount: _dataList.length + 2,
                    itemBuilder: (ctx, index) {
                      return _judgeWidgetByIndex(context, index);
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
      ),
    );
  }

  Widget _judgeWidgetByIndex(BuildContext context,int index){
      if(index == 0){
        return _buildTopHeader(context);
      }else if(index == _dataList.length + 1){
        return _buildBottomWidget(context);
      }else{
        return _buildItem(context);
      }
  }

  Widget _buildTopHeader(BuildContext context){
      return Container(
        padding: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(30),bottom: ScreenAdaper.width(20)),
        child: Text('考核项目，无菌技术评分标准',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(34)),),
      );
  }

  Widget _buildBottomWidget(BuildContext context){
      return Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(30)),
        child: GestureDetector(
          child: Row(
            children: [
              Image.asset("asset/images/home/koufenjia.png",width: ScreenAdaper.width(40),height: ScreenAdaper.width(40),),
              SizedBox(width: ScreenAdaper.width(20),),
              Text("添加扣分项",style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(26)),),
            ],
          ),
          onTap: (){
            LogUtil.d("点击了添加扣分项按钮");
          },
        ),
      );
  }

  Widget _buildItem(BuildContext context){


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
              child: Text("提交",style: TextStyle(color: Colors.white),),
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

}
