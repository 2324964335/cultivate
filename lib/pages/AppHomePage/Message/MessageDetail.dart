import 'package:flutter/material.dart';
import 'package:flutter_section_list/flutter_section_grid.dart';
import '../../../utils/util.dart';
import 'package:flutter_section_list/flutter_section_list.dart';
import 'package:flutter/cupertino.dart';
import './message_request/message_model_list_entity.dart';
class MessageDetail extends StatefulWidget {
  MessageDetail({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail>  with SectionAdapterMixin, SectionGridAdapterMixin {

  MessageModelListList _data = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = this.widget.params["param"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息详情'),),
      body:Container(
        color: Colors.white,
        child: SectionGridView.builder(adapter: this),
      ),
    );
  }

  void _changeCount(){
    LogUtil.d('-----点击了课堂');
    ///LessonPlayer
    Navigator.pushNamed(
      context,
      '/lessonPlayer',
      arguments: {}, //　传递参数
    );
  }

  int count = 0;

  @override
  Widget getItem(BuildContext context, IndexPath indexPath) {
    // TODO: implement getItem

//    EdgeInsets inset = getSectionInsets(indexPath.section);
//    double totalWidth = crossAxisExtent - getCrossAxisSpacing(indexPath.section) - inset.left - inset.right;
//    double width;
//    double height;
//
//    switch(indexPath.item % 6){
////      case 0 :
////      case 4 :
////        width = totalWidth / 3;
////        height = 200;
////        break;
//      default :
//        width = totalWidth / 5.3;
//        height = (200 - getMainAxisSpacing(indexPath.section)) / 2;
//        break;
//    }
//
//    return GestureDetector(
//      onTap: (){
////        _changeCount();
//      },
//      child: Container(
//          width: width,
//          height: width*1,
//          child: Column(
//            children: [
//              Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
//              LightText.build('王淑珍')
//            ],
//          ),
//      ),
//    );
  return Container();
  }

  @override
  int numberOfItems(int section) {
    return this.count;
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
      padding: EdgeInsets.only(left: ScreenAdaper.width(40),top: ScreenAdaper.width(20),right: ScreenAdaper.width(40)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(

                    children: [
                      CachedNetworkImage(imageUrl: _data.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
//                      Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(75),height:ScreenAdaper.width(75),),
                      SizedBox(width: ScreenAdaper.width(20),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenAdaper.height(20),),
                          Row(
                            children: [
                              Text(_data.title,style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
                              SizedBox(width: ScreenAdaper.width(40),),
//                              Text(_data.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                            ],
                          ),
                          SizedBox(height: ScreenAdaper.height(20),),

                          Text(_data.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),

                          SizedBox(height: ScreenAdaper.height(20),),
                          Container(
                            width: ScreenAdaper.width(550),
//                            height: ScreenAdaper.height(60),
                            child:Text(_data.content,style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),maxLines: 2,),
                          ),
                          SizedBox(height: ScreenAdaper.height(20),),
//                          Row(
//                            children: [
//                              LightText.build('接收范围：'),
//                              DarkText.build('护理部'),
//                              SizedBox(width: ScreenAdaper.width(15),),
//                            ],
//                          ),
                        ],
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(40)),
            color: Color(0xffe7e7e7),
            height: ScreenAdaper.height(1),
            width: ScreenAdaper.width(680),
          ),
//          SizedBox(height: ScreenAdaper.width(30),),
//          Container(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                DarkText.buildBold('未读人员'),
//                GestureDetector(
//                  child: Container(
//                    color: Colors.white,
//                    child: Row(
//                      children: [
//                        Image.asset("asset/images/message/ding.png",width: ScreenAdaper.width(35),height:ScreenAdaper.width(35),),
//                        LightText.buildColor('DING一下', Color(0xffF1B900)),
//                      ],
//                    ),
//                  ),
//                  onTap: (){
//                    ToastShow.show('已经通知未读人员');
//                  },
//                )
//              ],
//            ),
//          ),
//          SizedBox(height: ScreenAdaper.width(30),),

        ],
      ),
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
    return Container();
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
