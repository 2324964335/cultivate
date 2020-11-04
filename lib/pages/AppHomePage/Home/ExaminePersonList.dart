import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_examine_person_list_model_entity.dart';
class ExaminePersonList extends StatefulWidget {
  ExaminePersonList({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExaminePersonListState createState() => _ExaminePersonListState();
}

class _ExaminePersonListState extends State<ExaminePersonList> {

  HomeExaminePersonListModelEntity _dataList = null;
  List _dataList_list = [];
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
      "id":this.widget.params['id'],
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestCurrentMonthExaminPersonList(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList_list = [];
        _dataList = value;
        _dataList_list.addAll(value.xList);
        canContinueLoading = true;
      }else{
        if((value.xList as List).length > 0) {
          _dataList_list.addAll(value.xList);
        }
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
    return Scaffold(
      appBar: AppBar(title: Text('考核人员列表'),),
      body: Container(
                child:  RefreshIndicator(
                            onRefresh: _handleRefresh,
                            child:ListView.builder(
                                        controller: _scrollController,
                                        physics: new AlwaysScrollableScrollPhysics(),
                                        itemCount: _dataList_list.length,
                                        itemBuilder: (ctx,index){
                                      return _buildItem(context,index);
                                    }),
                                 )
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    HomeExaminePersonListModelList item = _dataList_list[index];
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
                        CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(90),height: ScreenAdaper.width(90),fit: BoxFit.contain,),

                        SizedBox(width: ScreenAdaper.width(15),),
                        Text(item.workName,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text(item.workNo,style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                      child:Text(item.date,style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
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
            '/examinePersonUpload',
            arguments: {}, //　传递参数
          );

        },
      ),
    );
  }
}
