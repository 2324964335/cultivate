import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import '../home_request/HomeRequest.dart';
import '../home_request/cultivate_manger_neng_data_list_entity.dart';
import '../../../../components/flutter_jd_address_selector.dart';
import '../home_request/cultivate_manger_level_model_entity.dart';

class CultivateSecondMangerNengChildWidget extends StatefulWidget {
  @override
  _CultivateSecondMangerNengChildWidgetState createState() => _CultivateSecondMangerNengChildWidgetState();
}

class _CultivateSecondMangerNengChildWidgetState extends State<CultivateSecondMangerNengChildWidget>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CultivateMangerNengDataListEntity _dataList = null;
  List _dataList_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool canContinueLoading = true;
  int PageIndex = 1;
  bool isLevel = false;
  bool isKe = false;
  bool isLearn = false;

  String levelString = "全部";
  String keString = "全部";
  String learndString = "全部";
  CultivateMangerLevelModelEntity _levelList = null;

  void getLevelList(){
    HomeRequest.requestCultivateMangerLevelList(StorageUtil().getSureUserModel().TokenID).then((value){
      _levelList = value;
      setState(() {
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getLevelList();
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
      'Level':'-1',
      'Classtype':'-1',
      'ST_See':'-1',
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestCultivateMangerNengList(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList_list = [];
        _dataList = value;
        _dataList_list.addAll(value.data);
        canContinueLoading = true;
      }else{
        if((value.data as List).length > 0) {
          _dataList_list.addAll(value.data);
        }
        if((value.data as List).length < 10){
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
              itemCount: _dataList_list.length == 0 ? 2:_dataList_list.length + 1,
              controller: _scrollController,
              itemBuilder: (ctx, index) {
                return buildItemByIndex(context,index);
              }
          ),
        )
    );
  }


  Widget buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildTopItem(context, index);
    }else{
      if(_dataList_list.length == 0){
        return _buildGNoData(context);
      }else{
        return _buildItem(context, index-1);
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

  Widget _buildItem(BuildContext context,int index){
    CultivateMangerNengDataListData ittem = _dataList_list[index];
    Color colorr = Color(0xFFBD4EFB);
    String title_string = "";
    if(ittem.classType == 0){
      title_string = "选修";
      colorr = Color(0xFFBD4EFB);
    }else if(ittem.classType == 1){
      title_string = "必修";
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

                        child: Text(ittem.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16)),

//                               color: Color(0xFFBD4EFB),

                        padding: EdgeInsets.all(ScreenAdaper.width(10)),
                        decoration: BoxDecoration(
                          color: colorr,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                              topRight: Radius.circular(3)),
                        ),
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
                              Text(ittem.opRegist,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                              SizedBox(width: ScreenAdaper.width(40),),
                              Text(ittem.bizTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                            ],
                          ),
                        ),
//                        Container(
//                          child: Row(
//                            children: [
//                              Container(
//                                margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
//
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: [
//                                    Image.asset("asset/images/home/dianzan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
//                                    SizedBox(width: ScreenAdaper.width(5),),
//                                    Text(ittem.likeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
//                                  ],
//                                ),
//
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
//
//                                child: Row(
//                                  children: [
//                                    Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
//                                    SizedBox(width: ScreenAdaper.width(5),),
//                                    Text(ittem.commentCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
//                                  ],
//                                ),
//
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: [
//                                    Image.asset("asset/images/home/chakan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
//                                    SizedBox(width: ScreenAdaper.width(5),),
//                                    Text(ittem.seeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
//                                  ],
//                                ),
//
//                              ),
//                            ],
//                          ),
//                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              LogUtil.d("------点击");
//              Navigator.pushNamed(
//                context,
//                '/informationDetailComment',
//                arguments: {'broadId':ittem.broadID,'id':ittem.linkID,'st_see':ittem.st_see}, //　传递参数
//              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTopItem(BuildContext context,int index){
    return Container(
      height: ScreenAdaper.width(80),
      margin: EdgeInsets.only(top: ScreenAdaper.width(17)),
      padding: EdgeInsets.all(ScreenAdaper.width(20)),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(levelString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset("asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                ],
              ),
            ),
            onTap: (){
              List titlr_arr = [];
              titlr_arr.add('全部');
              _levelList.data.forEach((element) {
                titlr_arr.add(element.name);
              });
              _choiceDialog("选择级别", titlr_arr);
             },
          ),
          Container(
            color: Color(0xffDDDDDD),
            width: ScreenAdaper.width(1),
            height: ScreenAdaper.width(100),
          ),
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(keString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset("asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择课程", ['全部','选修课','必修课']);

            },
          ),
          Container(
            color: Color(0xffDDDDDD),
            width: ScreenAdaper.width(1),
            height: ScreenAdaper.width(100),
          ),
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(learndString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset("asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择学习进度", ['全部','已学习','未学习']);

            },
          )
        ],
      ),
    );
  }

  void _choiceDialog(String titlee,List titleList) async {
    if(titlee == '选择级别'){
      isLevel = true;
    }else if(titlee == '选择课程'){
      isKe = true;
    } else{
      isLearn = true;
    }
    setState(() {});
    print('======');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return JDAddressDialog(
              onSingleSelected: (title) {
//                titleList.forEach((element) {
//                  if(element.name == title){
//                    if(title == '选择日期'){
//                      timeString = element;
//                    }else if(title == '选择阅读'){
//                      readString = element;
//                    }else{
//                      remindString = element;
//                    }
//                  }
//                });

                if(titlee == '选择级别'){
                  levelString = title;
                  isLevel = false;
                }else if(titlee == '选择课程'){
                  keString = title;
                  isKe = false;
                }else{
                  learndString = title;
                  isLearn = false;
                }
                PageIndex = 1;
                _dataList_list = [];
                getListData(PageIndex);
                setState(() {});
              },
              title: titlee,
              titleArr: titleList,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }
}
