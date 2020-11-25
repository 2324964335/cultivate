import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import '../home_request/HomeRequest.dart';
import '../home_request/current_month_examine_list_entity.dart';
class CurrentMonthExamineChildWidget extends StatefulWidget {
  final int index;
  final int examineType;
  final int isEnd;
  CurrentMonthExamineChildWidget(this.index,this.isEnd,this.examineType);
  @override
  _CurrentMonthExamineChildWidgetState createState() => _CurrentMonthExamineChildWidgetState();
}

class _CurrentMonthExamineChildWidgetState extends State<CurrentMonthExamineChildWidget>   with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  CurrentMonthExamineListEntity _data = null;
  List _data_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool canContinueLoading = true;
  int PageIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    getListData(1);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        getListData(PageIndex);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();

  }

  void getListData(int pageIndex){
    if(pageIndex!=1&&canContinueLoading == false){
      ToastShow.show('暂无更多数据');
      return;
    }
    Map params = {
//      "page":0,
      "status":this.widget.isEnd,
      "pageIdx":pageIndex,
      "pageSize":10
    };
    HomeRequest.requestCurrentMonthExaminList(StorageUtil().getSureUserModel().TokenID, params).then((value){
      _data = value;
      if(pageIndex==1){
        _data_list= [];
        _data = value;
        _data_list.addAll(value.xList);
        canContinueLoading = true;
      }else{
        LogUtil.d('1111');
        if((value.xList as List).length > 0){
          LogUtil.d('1111');

          _data_list.addAll(value.xList);
        }
        if((value.xList as List).length < 10){
          canContinueLoading = false;
        }
      }
      PageIndex +=1;
      LogUtil.d('1112222221-------'+'${_data.xList.length}');

      setState(() {
      });
    });
  }

  Future<Null> _handleRefresh() async {
    PageIndex = 1;
    getListData(PageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child:
                ListView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),

                    itemCount: _data_list.length==0?1:_data_list.length,
                    controller: _scrollController,
                    itemBuilder: (ctx, index) {
                      return buildItemByIndex(context,index);
                    }
                ),
      )
    );
  }


  Widget buildItemByIndex(BuildContext context,int index){
    if(_data_list.length == 0){
      return _buildGNoData(context);
    }else{
      return _buildItem(context, index);
    }
  }

  Widget _buildGNoData(BuildContext context){
    return GestureDetector(
      child: Container(
        width: ScreenAdaper.width(750),
        height: ScreenAdaper.width(700),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/images/home/zanwushuju.png",width: ScreenAdaper.width(70),height:ScreenAdaper.width(70),),
            SizedBox(height: ScreenAdaper.width(20),),
            LightText.build('暂无数据'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    CurrentMonthExamineListList item = _data_list[index];
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Color(0xfff5f5f5),
                    offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: Row(
            children: [
             Container(
               margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),right: ScreenAdaper.width(20),),
               width: ScreenAdaper.width(150),
               height: ScreenAdaper.width(150),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(4.0),
                   gradient: LinearGradient(
                     colors: item.status==0?[Color(0xFFFF9177), Color(0xFFF64640)]:[Color(0xFFCECCCC), Color(0xFFCECCCC)],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                   )),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('满分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(34),fontWeight: FontWeight.bold),),
                    SizedBox(height: ScreenAdaper.height(1),),
                    Text('${item.score.toString()}分',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
                  ],
               ),
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       alignment: Alignment.centerLeft,
                       width: ScreenAdaper.width(300),
                       margin: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(16)),
                       child: Text(item.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),maxLines: 1,overflow: TextOverflow.ellipsis,),
                     ),
                     SizedBox(width: ScreenAdaper.width(45),),
                     Row(
                       children: [
                         Container(
                           margin: EdgeInsets.only(right: ScreenAdaper.width(15),top: ScreenAdaper.height(16)),

//                               color: Color(0xFFBD4EFB),

                           padding: EdgeInsets.all(ScreenAdaper.width(10)),
                           decoration: BoxDecoration(
                             color: item.category==0?Color(0xFFBD4EFB):Color(0xFF00D08D),
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(3),
                                 bottomLeft: Radius.circular(3),
                                 bottomRight: Radius.circular(3),
                                 topRight: Radius.circular(3)),
                           ),
                           child: Text(item.category==0?"操作":"理论",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                         ),
                         Container(
                           margin: EdgeInsets.only(top: ScreenAdaper.height(16)),

//                           color: item.status==0?Color(0xFF00D08D):Color(0xFFCECCCC),
                           decoration: BoxDecoration(
                             color: item.status==0?Color(0xFF00D08D):Color(0xFFCECCCC),
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(3),
                                 bottomLeft: Radius.circular(3),
                                 bottomRight: Radius.circular(3),
                                 topRight: Radius.circular(3)),
                           ),
                           padding: EdgeInsets.all(ScreenAdaper.width(10)),
                           child: Text(item.status==0?"未开始":"已结束",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                         ),
                       ],
                     )
                   ],
                 ),
                 Container(
                   margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                   color: Colors.black26,
                   height: ScreenAdaper.height(1),
                   width: ScreenAdaper.width(510),
                 ),
                 SizedBox(height: ScreenAdaper.width(10),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width: ScreenAdaper.width(20),),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('开始时间:',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                         SizedBox(height: ScreenAdaper.width(10),),
                         Text('结束时间',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                       ],
                     ),
                     SizedBox(width: ScreenAdaper.width(20),),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(item.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                         SizedBox(height: ScreenAdaper.width(10),),
                         Text(item.endTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                       ],
                     )
                   ],
                 ),
                 SizedBox(height: ScreenAdaper.width(10),),
               ],
             ),
           ],
          ),
        ),
        onTap: (){
          if(widget.index == 1){
            if(widget.examineType== 2){
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":2}, //　传递参数
              );
            }else if(widget.examineType== 1){
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":1}, //　传递参数
              );
            }
            else{
              Navigator.pushNamed(
                context,
                '/examinePersonListResult',
                arguments: {"examineType":0}, //　传递参数
              );
            }//　传递参数

          }else if(widget.index == 0){
            if(item.category== 1){
              Navigator.pushNamed(
                context,
                '/theoryExamineQuestion',
                arguments: {}, //　传递参数
              );
            }else{
              Navigator.pushNamed(
                context,
                '/examinePersonList',
                arguments: {'id':item.iD,'title':item.title}, //　传递参数
              );
            }
          }
          ///ExaminePersonListResult
        },
      ),
    );
  }
}
