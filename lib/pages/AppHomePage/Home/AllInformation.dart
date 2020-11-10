import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/flutter_jd_address_selector.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_page_data_entity.dart';

class AllInformation extends StatefulWidget {
  AllInformation({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AllInformationState createState() => _AllInformationState();
}

class _AllInformationState extends State<AllInformation> {

  bool isFanWei = false;
  bool isRead = false;

  String fanweiString = "全部";
  String readString = "全部";
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
      "ST_See":_yue,
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
                            itemCount: 100,
                            itemBuilder: (ctx,index){
                              return _buildItemByIndex(context, index);
                            },
                          ),
                      )
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildTopItem(context, index);
    }else{
      return _buildItem(context,index);
    }
  }

  Widget _buildTopItem(BuildContext context,int index){
    return Container(
      height: ScreenAdaper.width(80),
      margin: EdgeInsets.only(top: ScreenAdaper.width(17)),
      padding: EdgeInsets.only(top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20),left: ScreenAdaper.width(60),right: ScreenAdaper.width(60)),
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
                  Text(fanweiString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isFanWei==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),
                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择类型", ['全部','科室','院内']);
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
                  Text(readString,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Image.asset(isRead==true?"asset/images/home/richengguan.png":"asset/images/home/richengkai.png",width: ScreenAdaper.width(25),height:ScreenAdaper.width(25),),

                ],
              ),
            ),
            onTap: (){
              _choiceDialog("选择阅读", ['全部','已阅读','未阅读']);

            },
          ),
        ],
      ),
    );
  }

  void _choiceDialog(String titlee,List titleList) async {
    if(titlee == '选择发布范围'){
      isFanWei = true;
    }else{
      isRead = true;
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

                if(titlee == '选择发布范围'){
                  fanweiString = title;
                  isFanWei = false;
                }else{
                  readString = title;
                  isRead = false;
                }
                setState(() {});
              },
              title: titlee,
              titleArr: titleList,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }


  Widget _buildItem(BuildContext context,int index){
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

                        child: Text("2020.8 传染病防控",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
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
                  Container(
                    padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(

                            children: [
                              Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
                              SizedBox(width: ScreenAdaper.width(20),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: ScreenAdaper.height(20),),
                                  Row(
                                    children: [
//                                      SizedBox(width: ScreenAdaper.width(20),),
                                      Text('主讲人：',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                      Text('某某某',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                      SizedBox(width: ScreenAdaper.width(50),),
                                      Text('开始时间:',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                      Text('2020年8月20日',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                    ],
                                  ),
                                  SizedBox(height: ScreenAdaper.height(20),),

                                  Text('请至微课堂栏目中进行学习',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                  SizedBox(height: ScreenAdaper.height(20),),

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
                                              Text("126",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                            ],
                                          ),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                          child: Row(
                                            children: [
                                              Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                              SizedBox(width: ScreenAdaper.width(5),),
                                              Text("64",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
                                              Text("1526",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
                '/informationDetail',
                arguments: {}, //　传递参数
              );
            },
          ),
        ),
      ),
    );
  }
}
