import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/flutter_jd_address_selector.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_page_data_entity.dart';

class NoReadInfomation extends StatefulWidget {
  NoReadInfomation({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _NoReadInfomationState createState() => _NoReadInfomationState();
}

class _NoReadInfomationState extends State<NoReadInfomation> {

  bool isFanWei = false;
  bool isRead = false;
  
  String _lei = '-1';
  String _yue = '-1';

  HomePageDataEntity _dataList = null;
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
      "LinkType":_lei,
      "ST_See":0,
      "pageIdx":pageIndex,
      "pageSize":10
    };
    HomeRequest.requestHomePageData(StorageUtil().getSureUserModel().TokenID,params).then((value){
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
      appBar: AppBar(title: Text('公告'),),
      body: Container(
          child:
          RefreshIndicator(
            onRefresh: _handleRefresh,
            child:
            ListView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: _dataList_list.length,
              itemBuilder: (ctx,index){
                return _buildItemByIndex(context, index);
              },
            ),
          )
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
      return _buildItem(context,index);
    
  }

 
  Widget _buildItem(BuildContext context,int index){
    HomePageDataList item = _dataList_list[index];
    Color colorr = Color(0xFFBD4EFB);
    String title_string = "";
    if(item.linkType == 0){
      title_string = "公告";
      colorr = Color(0xFFBD4EFB);
    }else if(item.linkType == 1){
      title_string = "员工培训";
      colorr = Color(0xFF00D08D);
    }else if(item.linkType == 2){
      title_string = "员工考核";
      colorr = Color(0xFFBD4EFB);
    }else if(item.linkType == 3){
      title_string = "微课堂";
      colorr = Color(0xFF00D08D);
    }
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
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
        child: new ClipRRect(

          borderRadius: BorderRadius.circular(5),
          child:
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(

                    children: [
                      Container(

                        child: Text(item.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

                        color: colorr,

                        padding: EdgeInsets.all(ScreenAdaper.width(10)),
                        child: Text(title_string,style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
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
                  Container(
                    padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(

                            children: [
                              CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
                              SizedBox(width: ScreenAdaper.width(20),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: ScreenAdaper.height(20),),
                                  Row(
                                    children: [
//                                      SizedBox(width: ScreenAdaper.width(20),),
                                      Text('发布人：',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                      Text(item.senderObjName,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                      SizedBox(width: ScreenAdaper.width(50),),
                                      Text('开始时间:',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                      Text(item.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                    ],
                                  ),
                                  SizedBox(height: ScreenAdaper.height(20),),

//                                  Text('请至微课堂栏目中进行学习',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
//                                  SizedBox(height: ScreenAdaper.height(20),),

                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset("asset/images/home/dianzan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                              SizedBox(width: ScreenAdaper.width(5),),
                                              Text(item.likeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                            ],
                                          ),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                          child: Row(
                                            children: [
                                              Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                              SizedBox(width: ScreenAdaper.width(5),),
                                              Text(item.commentCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                            ],
                                          ),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset("asset/images/home/chakan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                              SizedBox(width: ScreenAdaper.width(5),),
                                              Text(item.seeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                            ],
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: ScreenAdaper.height(20),)
                                ],
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              LogUtil.d("------点击");
              Navigator.pushNamed(
                context,
                '/informationDetailComment',
                arguments: {'broadId':item.broadID,'id':item.linkID,'st_see':item.st_see}, //　传递参数
              );
            },
          ),
        ),
      ),
    );
  }
}
