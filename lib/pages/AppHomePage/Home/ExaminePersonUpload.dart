import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class ExaminePersonUpload extends StatefulWidget {
  ExaminePersonUpload({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonUploadState createState() => _ExaminePersonUploadState();
}

class _ExaminePersonUploadState extends State<ExaminePersonUpload> {
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
      ),
    );
  }

  Widget _judgeWidgetByIndex(BuildContext context,int index){

  }

  Widget _buildTopHeader(BuildContext context){

  }

  Widget _buildBottomWidget(BuildContext context){

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
