import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_classroom_data_video_entity.dart';
class LessonPlayer extends StatefulWidget {
  LessonPlayer({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _LessonPlayerState createState() => _LessonPlayerState();
}

class _LessonPlayerState extends State<LessonPlayer> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  HomeClassroomDataVideoData _videoData = null;
  @override
  void initState() {
    super.initState();

//    _videoPlayerController1 = VideoPlayerController.network(
//        'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4');
//    _chewieController = ChewieController(
//      videoPlayerController: _videoPlayerController1,
//      aspectRatio: 3 / 2,
//      autoPlay: true,
//      looping: true,
//    );
    getVideoData();
  }

  void getVideoData(){
    Map params = {
      "id":this.widget.params["id"]
    };
    HomeRequest.requestHomeSmallClassItemData(StorageUtil().getSureUserModel().TokenID, params).then((value){
        _videoData = value.data;
        _videoPlayerController1 = VideoPlayerController.network(
            Uri.encodeFull(_videoData.fillPath));
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController1,
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true,
          allowedScreenSleep: false,
//          showControls: false
//        customControls: Container(
//          width: ScreenAdaper.width(750),
//          height: ScreenAdaper.width(500),
////          color: Colors.red,
//        )
        );
        setState(() {
        });
    });
  }



  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          //leading, // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。如果没有Drawer ， 默认的是个返回箭头
          //title, // 标题
          //actions, // 右边的icon， 一般的是icon 或者是文字
          //bottom,         //底部内容区域  通常是个 tabbar
          //elevation, //阴影,纸墨设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
          //brightness,   // 状态栏 两种  Brightness.light,   白底黑字 Brightness.dark:黑底白字
          //centerTitle,     //标题是否居中, 标题是否居中显示，默认值根据不同的操作系统，显示方式不一样
          primary: true,// 预留状态栏
//          backgroundColor: Colors.red,
          forceElevated: false, //展开flexibleSpace之后是否显示阴影

          automaticallyImplyLeading: true,   // 如果有 leading 这个不会管用 ,相当于忽略这个参数 ； 如果没有leading ，当有侧边栏的时候， false：不会显示默认的图片，true 会显示 默认图片，并响应打开侧边栏的事件

//            titleSpacing: NavigationToolbar.kMiddleSpacing,//flexibleSpace 和 title 的距离 默认是重合的

          expandedHeight: ScreenAdaper.width(460),//200.0, 可滚动视图的高度  伸缩区域大小

          snap: true,//与floating结合使用
          floating: true, //是否随着滑动隐藏标题,滑动到最上面，再snap滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
          pinned: false,  //是否固定在顶部,往上滑，导航栏可以隐藏
          leading:GestureDetector(
            child: Icon(
                Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
            flexibleSpace:_topPlayer()

        )
      ];
    },
    body: Center(
    child: ListView.builder(
      itemCount: 14,
      itemBuilder: (ctx,index){
        return _buildWidgetByIndex(context,index);
      },
    ),
    ),
    )

//      _buildBody()
    );
  }
  _topPlayer() {
    return Container(
      child: _videoData==null?Container():Chewie(
        controller: _chewieController,
      ),
    );
  }

  Widget ListItem(var index) {
    return new ListTile(
      title:  Center(child: Text(
        "条目$index",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),),
    );
  }

  Widget _buildWidgetByIndex(BuildContext context,int index){
      if(index == 0){
        return _buildHeader(context);
      }else{
        return _buildItem(context, index);
      }
  }

  Widget _buildHeader(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
      padding: EdgeInsets.all(ScreenAdaper.width(20)),
      child: Text('课程',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
    );
  }

  Widget _buildItem(BuildContext context,int index){
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
          child:  Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenAdaper.width(30),top: ScreenAdaper.height(16),left: ScreenAdaper.height(16),bottom: ScreenAdaper.height(16)),

                color: Color(0xFFFF5B3E),
                width: ScreenAdaper.width(40),
                height: ScreenAdaper.width(40),
                alignment: Alignment.center,
                padding: EdgeInsets.all(ScreenAdaper.width(10)),
                child: Text(index.toString(),style: TextStyle(color: Colors.white,fontSize:ScreenAdaper.sp(20)),),
              ),
              DarkText.build('传染病防治传染病防治备份'),
            ],
          ),
        ),
        onTap: (){
        },
      ),
    );
  }
}
