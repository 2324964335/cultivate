import 'package:flutter/material.dart';
import 'package:flutter_section_list/flutter_section_grid.dart';
import '../../../utils/util.dart';
import 'package:flutter_section_list/flutter_section_list.dart';
import 'package:flutter/cupertino.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_classroom_data_entity.dart';
class SmallClassroom extends StatefulWidget {
  SmallClassroom({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _SmallClassroomState createState() => _SmallClassroomState();
}

class _SmallClassroomState extends State<SmallClassroom>  with SectionAdapterMixin, SectionGridAdapterMixin {

  HomeClassroomDataEntity _dataList = null;
  List _dataList_list = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool canContinueLoading = true;
  int PageIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData(1);
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
//      'type':this.widget.index,
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestHomeSmallClassData(StorageUtil().getSureUserModel().TokenID,params).then((value){
      _dataList = value;
      if(pageIndex==1){
        _dataList_list = [];
        _dataList = value;
        _dataList_list.addAll(value.data);
        canContinueLoading = true;
      }else{
        if((value.xList as List).length > 0) {
          _dataList_list.addAll(value.data);
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
      appBar: AppBar(title: Text('微课堂'),),
      body:RefreshIndicator(
              onRefresh: _handleRefresh,
              child:SectionGridView.builder(
                        physics: new AlwaysScrollableScrollPhysics(),
                        adapter: this,
                          controller: _scrollController,
                      ),
      )
    );
  }


//  int count = _dataList_list.length;

  @override
  Widget getItem(BuildContext context, IndexPath indexPath) {
    // TODO: implement getItem
    HomeClassroomDataData itemm = _dataList_list[indexPath.item];
    EdgeInsets inset = getSectionInsets(indexPath.section);
    double totalWidth = crossAxisExtent - getCrossAxisSpacing(indexPath.section) - inset.left - inset.right;
    double width;
    double height;

    switch(indexPath.item % 6){
//      case 0 :
//      case 4 :
//        width = totalWidth / 3;
//        height = 200;
//        break;
      default :
        width = totalWidth / 2;
        height = (200 - getMainAxisSpacing(indexPath.section)) / 2;
        break;
    }

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          '/lessonPlayer',
          arguments: {'id':itemm.iD,'category':itemm.category}, //　传递参数
        );
      },
      child: Container(
        width: totalWidth / 2,
        height: ScreenAdaper.width(370),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
//              color: Color(0xffF1B900),
              width: totalWidth / 2,
              height: ScreenAdaper.width(200),
              child:
              CachedNetworkImage(imageUrl: itemm.images,errorWidget: (context, url, error) => Icon(Icons.error),width:totalWidth / 2,height: ScreenAdaper.width(200),fit: BoxFit.contain,),
            ),
            SizedBox(height: ScreenAdaper.width(10),),

            Text(itemm.title,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(32),fontWeight: FontWeight.bold),),
            SizedBox(height: ScreenAdaper.width(10),),
            LightText.build(itemm.category),
            SizedBox(height: ScreenAdaper.width(10),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LightText.build('${itemm.score.toString()}课时'),
                Container(
                  padding: EdgeInsets.only(right: ScreenAdaper.width(10)),
                  child: LightText.build('${itemm.learnCount}次学习'),
                ),

              ],
            ),
          ],
        )
      ),
    );
  }

  @override
  int numberOfItems(int section) {
    return _dataList_list.length;
  }

  @override
  int numberOfSections() {
    return 1;
  }

  @override
  double getMainAxisSpacing(int section) {
    return 5;
  }

  @override
  double getCrossAxisSpacing(int section) {
    return 5;
  }

  @override
  EdgeInsets getSectionInsets(int section) {
    return EdgeInsets.fromLTRB(10, 8, 10, 8);
  }

  @override
  bool shouldExistSectionHeader(int section) {
    return true;
  }

  @override
  bool shouldSectionHeaderStick(int section) {
    return true;
  }

  @override
  bool shouldExistSectionFooter(int section) {
    return section % 2 != 0;
  }

  @override
  double getFooterItemSpacing(int section) {
    return 5;
  }

  @override
  double getHeaderItemSpacing(int section) {
    return 5;
  }

  @override
  Widget getSectionHeader(BuildContext context, int section) {
    return Container(
      color: Colors.white,
      width: ScreenAdaper.screenW(context),
      height: ScreenAdaper.height(70),
      padding: EdgeInsets.only(left: ScreenAdaper.width(20)),
      alignment: Alignment.centerLeft,
      child: DarkText.build('热门微课'),
    );
  }

  @override
  Widget getSectionFooter(BuildContext context, int section) {
    return Container(
    );
  }

  @override
  bool shouldExistHeader() {
    return true;
  }

  @override
  bool shouldExistFooter() {
    return true;
  }

  @override
  Widget getHeader(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScreenAdaper.width(200),
        margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
        padding: EdgeInsets.all(ScreenAdaper.width(40)),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text('0',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(70)),),
                        LightText.build('分钟'),
                      ],
                    ),
                    LightText.build('今日学习'),

                  ],
                ),
              ],
            ),
            Container(
              color: Color(0xffDDDDDD),
              width: ScreenAdaper.width(1),
              height: ScreenAdaper.width(100),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text('1',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(70)),),
                        LightText.build('天'),
                      ],
                    ),
                    LightText.build('连续学习'),

                  ],
                ),
              ],
            ),
            Container(
              color: Color(0xffDDDDDD),
              width: ScreenAdaper.width(1),
              height: ScreenAdaper.width(100),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text('15',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(70)),),
                        LightText.build('小时'),
                      ],
                    ),
                    LightText.build('累计学习'),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: (){
        LogUtil.d('-----');
        Navigator.pushNamed(
          context,
          '/smallClassroomLearnStep',
          arguments: {}, //　传递参数
        );
      },
    );
  }

  @override
  Widget getFooter(BuildContext context) {
    return Container(
      height: ScreenAdaper.width(70),
      color: Colors.white,
      child: Center(
        child: LightText.build('没有更多了…'),
      ),
    );
  }

}
