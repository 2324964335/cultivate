import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'home_request/HomeRequest.dart';
import '../../../components/text_field.dart';
import 'home_request/home_page_data_entity.dart';
class HomeInfomationSearch extends StatefulWidget {
  HomeInfomationSearch({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _HomeInfomationSearchState createState() => _HomeInfomationSearchState();
}

class _HomeInfomationSearchState extends State<HomeInfomationSearch> {
  //用于焦点
  final FocusNode _inputNode = FocusNode();
  TextEditingController _inputController = TextEditingController();
  HomePageDataEntity _dataList = null;
  List _dataList_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool canContinueLoading = true;
  int PageIndex = 1;
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
//    getListData(1);
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
    _inputController.dispose();
  }

  void getListData(int pageIndex){
    if(pageIndex!=1&&canContinueLoading == false){
      ToastShow.show('暂无更多数据');
      return;
    }

    if(_inputController.text.length == 0){
      ToastShow.show('请输入搜索词');
      return;
    }
    Map params = {
      'title':_inputController.text,
//      'title':'月',
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestHomeInformationByWords(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList_list = [];
        _dataList = value;
        _dataList_list.addAll(value.xList);
        canContinueLoading = true;
        if(_dataList_list.length == 0){
          ToastShow.show('搜不到与此关键词相关数据');
        }
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
      appBar: AppBar(title: Text('培训公告搜索'),),
      body: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                },
                child:
                        Container(
                          child: RefreshIndicator(
                                    onRefresh: _handleRefresh,
                                    child:
                                      ListView.builder(
                                          itemCount: _dataList == null? 2:_dataList_list.length==0?2:_dataList_list.length + 1,
                                          physics: new AlwaysScrollableScrollPhysics(),
                                          controller: _scrollController,
                                          itemBuilder: (ctx,index){
                                            return _buildByIndex(context, index);
                                          }
                                          ),
                                   )
                        ),
                 )
      );
  }

  Widget _buildByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildHeader(context, index);
    }else{
      if(_dataList_list.length == 0){
        return _buildGNoData(context);
      }else{
        return _buildItem(context, index -1);
      }
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

  Widget _buildHeader(BuildContext context,int index){
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
          child:Container(
            height: ScreenAdaper.width(84),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.grey,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenAdaper.width(14),),
                    Container(
                      width: ScreenAdaper.width(500),
                      height: ScreenAdaper.width(70),
                      padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
                      child: MyTextField(
                        focusNode: _inputNode,
                        placeHolder: '请输入需要搜索的内容',
                        maxLength: null,
                        noBottomLine: true,
                        keyboardType: TextInputType.multiline,
                        controller: _inputController,
                        isMultiHang: false,
                      ),
                    ),
                  ],
                ),
//                Container(
//                  width: ScreenAdaper.width(500),
//                  padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
//                  child: MyTextField(
//                    focusNode: _inputNode,
//                    placeHolder: '请输入需要搜索的内容',
//                    maxLength: null,
//                    noBottomLine: true,
//                    keyboardType: TextInputType.multiline,
//                    controller: _inputController,
//                    isMultiHang: false,
//                  ),
//                ),
                 SizedBox(width: ScreenAdaper.width(10),),
                Container(
                  alignment: Alignment.center,
                  height: ScreenAdaper.width(60),
                  width: ScreenAdaper.width(120),
                  child: OutlineButton(
                    child: Text('确定',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(23)),maxLines: 1,),
                    onPressed: (){
                      LogUtil.d('------');
//                      requestComment();
                      FocusScope.of(context).requestFocus(FocusNode());
                      canContinueLoading = true;
                      PageIndex = 1;
                      _dataList_list = [];
                      _dataList = null;
                      getListData(1);
                    },
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    HomePageDataList ittem = _dataList_list[index];
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

                        child: Text(ittem.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

//                        color: Color(0xFFBD4EFB),
                        decoration: BoxDecoration(
                          color: ittem.type==0?Color(0xFFBD4EFB):Color(0xFF00D08D),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                              topRight: Radius.circular(3)),
                        ),
                        padding: EdgeInsets.all(ScreenAdaper.width(10)),
                        child: Text(ittem.type==0?"线下":"线上",style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
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
//                                     ClipOval(
//                                       child: Container(
//                                         color: Colors.lightBlueAccent,
//                                         width: ScreenAdaper.width(70),
//                                         height: ScreenAdaper.width(70),
//                                       ),
//                                     ),
//                                     Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(70),height:ScreenAdaper.width(70),),
                              CachedNetworkImage(imageUrl: ittem.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(70),height: ScreenAdaper.width(70),fit: BoxFit.contain,),
                              SizedBox(width: ScreenAdaper.width(10),),
                              Text(ittem.trainer,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                              SizedBox(width: ScreenAdaper.width(40),),
                              Text(ittem.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                            ],
                          ),
                        ),
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
                                    Text(ittem.likeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                  ],
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                child: Row(
                                  children: [
                                    Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                    SizedBox(width: ScreenAdaper.width(5),),
                                    Text(ittem.commentCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
                                    Text(ittem.viewCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                  ],
                                ),

                              ),
                            ],
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
                arguments: {'id':ittem.iD,'st_see':ittem.st_see}, //　传递参数
              );
            },
          ),
        ),
      ),
    );
  }
}
