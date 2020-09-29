import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'dart:math';
import 'package:flutter_section_list/flutter_section_list.dart';

class SmallClassroomLearnStep extends StatefulWidget {
  SmallClassroomLearnStep({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _SmallClassroomLearnStepState createState() => _SmallClassroomLearnStepState();
}

class _SmallClassroomLearnStepState extends State<SmallClassroomLearnStep>  with SectionAdapterMixin, SectionGridAdapterMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('微课堂学习计划'),),
      body:
//      Container(
//        child: Center(
//          child: Text('ssadsdssd'),
//        ),
//      )
      SectionGridView.builder(adapter: this),
    );
  }

  void _clickStep(){
    LogUtil.d('-----点击了课堂');
  }

  int count = 7;

  @override
  Widget getItem(BuildContext context, IndexPath indexPath) {
    // TODO: implement getItem

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
        width = totalWidth;
        height = (200 - getMainAxisSpacing(indexPath.section)) / 2;
        break;
    }

    return GestureDetector(
      onTap: (){
        _clickStep();
      },
      child: Container(
        margin: EdgeInsets.all(ScreenAdaper.width(15)),
          width: totalWidth,
//          height: ScreenAdaper.width(270),
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LightText.build('8月7日下午13:20'),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdaper.width(10),left: ScreenAdaper.width(10),right: ScreenAdaper.width(10)),
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenAdaper.width(5)),
                      child:Container(
                        width: ScreenAdaper.width(10),
                        height: ScreenAdaper.width(10),
                        color: Color(0xff00D08D),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('传染病防治传染病防治',style: TextStyle(color: Color(0xff565656),fontSize:ScreenAdaper.sp(30)),),
                      SizedBox(height: ScreenAdaper.width(17),),
                      Row(
                        children: [
                          LightText.build('护理联盟'),
                          SizedBox(width: ScreenAdaper.width(25),),
                          LightText.build('10课时'),
                        ],
                      ),
                      SizedBox(height: ScreenAdaper.width(17),),
                      Row(
                        children: [
                          LightText.build('时长：20:30'),
                          SizedBox(width: ScreenAdaper.width(25),),

                          LightText.build('学习进度：60%'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenAdaper.width(20),),
              Line.build()
            ],
          )
      ),
    );
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
    return Container(
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
