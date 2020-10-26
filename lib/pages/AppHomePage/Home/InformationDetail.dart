import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/func.dart';
import '../../../components/alert_dialog.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_unread_information_detail_model_entity.dart';
class InformationDetail extends StatefulWidget {
  InformationDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {

  HomeUnreadInformationDetailModelEntity _data = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUnreadInformationDetail();
  }

  void _getUnreadInformationDetail(){
    HomeRequest.requestHomeUnreadInformationDentail(StorageUtil().getSureUserModel().TokenID, {"id":this.widget.params["id"]}).then((value){
        _data = value;
        setState(() {

        });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('公告详情'),),
      body: Stack(
        children: [
          Positioned(
              child:
              Container(
                child: ListView.builder(
                    itemCount: _data == null?0:1,
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

            borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
            child:
            Container(
              height: ScreenAdaper.width(90),
              width: ScreenAdaper.width(640),
              alignment: Alignment.center,
              color: Color(0xFF00D08D),
              child: Text("报名参加",style: TextStyle(color: Colors.white),),
            ),
          ),
          onTap: (){
            FunctionUtil.popDialog(
              context,
              ShowAlertDialog(
                title: "培训报名",
                content: "你已报名此次培训计划，请耐心等待培训管理人员审核，审核结果请注意查看消息通知",
                items: ['再想一下', '确认提交'],
                onTap: (index) {
                  LogUtil.d('object$index');
                  if(index == 1){
                    ToastShow.show("提交成功");
                    Navigator.pop(context);
                  }
                },
              ),
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
            Row(

              children: [
                Container(

                  child: Text(_data.title,style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                  margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                ),
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                  color: Color(0xFFF1B900),

                  padding: EdgeInsets.all(ScreenAdaper.width(10)),
                  child: Text("公告",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
              color: Color(0xffe7e7e7),
              height: ScreenAdaper.height(1),
              width: ScreenAdaper.width(680),
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('发布人：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text('某某某',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('发布时间:',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.tsRegist,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('培训类别：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.eduCategory,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('课程类型：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.classType,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('开始时间:',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.beginTime,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),
                Text('结束时间:',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.endtime,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),

                Text('讲   师',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text(_data.trainer,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),

                Text('学时：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),
                Text('${_data.traineeScore}课时',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),
            _data.status == 0?Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: ScreenAdaper.width(20),),

                    Text('地  点',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                    SizedBox(width: ScreenAdaper.height(10),),

                    Text(_data.address,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
                  ],
                ),
                SizedBox(height: ScreenAdaper.height(20),),

              ],
            ):Container(),
            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),

                Text('培训对象',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),

                Text(_data.eduObject,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
            SizedBox(height: ScreenAdaper.height(20),),

            Row(
              children: [
                SizedBox(width: ScreenAdaper.width(20),),

                Text('报名人数',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                SizedBox(width: ScreenAdaper.height(10),),

                Text('${_data.personCount}/${_data.personMax}人',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
