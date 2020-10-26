import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import '../home_request/HomeRequest.dart';
import '../home_request/current_cultivate_list_entity.dart';
class CurrentMonthCultiveChildWidget extends StatefulWidget {
  final int index;
  CurrentMonthCultiveChildWidget(this.index);
  @override
  _CurrentMonthCultiveChildWidgetState createState() => _CurrentMonthCultiveChildWidgetState();
}

class _CurrentMonthCultiveChildWidgetState extends State<CurrentMonthCultiveChildWidget>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CurrentCultivateListEntity _dataList = null;
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
      'type':this.widget.index,
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestCurrentCultivateData(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList = value;
        canContinueLoading = true;
      }else{
        _dataList.xList.addAll(value.xList);
        if((value.xList as List).length < 10){
          canContinueLoading = false;
        }
      }
      PageIndex +=1;
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
        child:ListView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),
                    itemCount: _dataList == null ? 0:_dataList.xList.length,
                    controller: _scrollController,
                    itemBuilder: (ctx, index) {
                      return _buildItem(context,index);
                    }
                ),
      )
    );
  }

  Widget _buildItem(BuildContext context,int index){
    CurrentCultivateListList data = _dataList.xList[index];
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                    child: Text(data.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                    color: Color(0xFF00D08D),

                    padding: EdgeInsets.all(ScreenAdaper.width(10)),
                    child: Text(data.type==0?'线下':'线上',style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                color: Colors.black26,
                height: ScreenAdaper.height(1),
                width: ScreenAdaper.width(680),
              ),
              SizedBox(height: ScreenAdaper.width(10),),
              Row(
                children: [
                  SizedBox(width: ScreenAdaper.width(20),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('主讲人：'+'${data.trainer}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('报名人数：'+'${data.personNumber.toString()}' +'人',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('开始时间：'+'${data.beginTime}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      SizedBox(height: ScreenAdaper.height(10),),
                      Text('地点：'+'${data.address}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                    ],
                  ),
//                  SizedBox(width: ScreenAdaper.width(20),),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('开始时间：'+'${data.beginTime}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
//                      SizedBox(height: ScreenAdaper.height(10),),
//                      Text('报名人数：'+'${data.personNumber.toString()}' +'人',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
//                    ],
//                  )
                ],
              ),
              SizedBox(height: ScreenAdaper.width(10),),
            ],
          ),
        ),
        onTap: (){
          if(widget.index == 2){
            Navigator.pushNamed(
              context,
              '/cultiveSignQrcode',
              arguments: {"id":data.iD,"title":data.title,"trainer":data.trainer}, //　传递参数
            );
          }else{
            Navigator.pushNamed(
              context,
              '/cultiveDetail',
              arguments: {"id":data.iD}, //　传递参数
            );
          }
        },
      ),
    );
  }
}
