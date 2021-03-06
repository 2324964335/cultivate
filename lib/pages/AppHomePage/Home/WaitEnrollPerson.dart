import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../components/func.dart';
import '../../../components/alert_dialog.dart';
class WaitEnrollPerson extends StatefulWidget {
  WaitEnrollPerson({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _WaitEnrollPersonState createState() => _WaitEnrollPersonState();
}

class _WaitEnrollPersonState extends State<WaitEnrollPerson> {
  SlidableController slidableController;
  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;
  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    LogUtil.d('-------aaaa');
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    LogUtil.d('-------');
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
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
        title: Text('报名人员审核'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (ctx,index){
//              return _buildItem();
            return _getSlidableWithDelegates(context, index, Axis.horizontal);
            }),
      ),
    );
  }

  Widget _getSlidableWithDelegates(
      BuildContext context, int index, Axis direction) {
//    final _HomeItem item = items[index];

    return Slidable.builder(
      key: Key(index.toString()),
      controller: slidableController,
      direction: direction,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        closeOnCanceled: true,
        onWillDismiss: (actionType){
            LogUtil.d('-----------aaaaa');
        },
        onDismissed: (actionType) {
          LogUtil.d('-----------aaaaabb');
        },
      ),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.20,
      child: _buildItem(),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 3,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                color: Color(0xffd8d8d8),
                iconWidget:Container(
                    color: Color(0xffd8d8d8),
//                    width: ScreenAdaper.width(70),
//                    height: ScreenAdaper.width(131),
                    alignment: Alignment.center,
                    child: Text('取消',style: TextStyle(color: Colors.white),),
                  ),
                onTap: (){
                  LogUtil.d('---------ddddddd');
                },
              );
            } else if(index == 1){
              return IconSlideAction(
                color: Color(0xffd8d8d8),
                iconWidget:Container(
                  color: Color(0xffFF5B3E),
//                  width: ScreenAdaper.width(70),
//                  height: ScreenAdaper.width(131),
                  alignment: Alignment.center,
                  child: Text('拒绝',style: TextStyle(color: Colors.white),),
                ),
                onTap: (){
                  LogUtil.d('---------ddddddd');
                  FunctionUtil.popDialog(
                    context,
                    ShowAlertDialog(
                      title: "审核不通过",

                      content: "请填写审核不通过原因",
                      items: ['取消', '确认提交'],
                      onTap: (index) {
                        LogUtil.d('object$index');
                        if(index == 1){
                          ToastShow.show("提交成功");
//                          Navigator.pop(context);
                        }
                      },
                      isShenhe: true,
                    ),
                  );
                },
              );
            }else {
              return IconSlideAction(
                color: Color(0xffd8d8d8),
                iconWidget:Container(
                  color: Color(0xff31D12B),
//                  width: ScreenAdaper.width(70),
//                  height: ScreenAdaper.width(131),
                  alignment: Alignment.center,
                  child: Text('通过',style: TextStyle(color: Colors.white),),
                ),
                onTap: (){
                  LogUtil.d('---------ddddddd');
                },
              );
            }
          }),
    );
  }

  Widget _buildItem(){
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
                        Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(90),height:ScreenAdaper.width(90),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text("刘医生",style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text("无菌技术组",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                      color: Color(0xFFFF5B3E),

                      padding: EdgeInsets.all(ScreenAdaper.width(10)),
                      child: Text("待审核",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
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

          LogUtil.d('------');
        },
      ),
    );
  }

}
