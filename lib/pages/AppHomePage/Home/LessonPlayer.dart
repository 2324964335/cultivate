import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
class LessonPlayer extends StatefulWidget {
  LessonPlayer({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _LessonPlayerState createState() => _LessonPlayerState();
}

class _LessonPlayerState extends State<LessonPlayer> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
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
        appBar: PreferredSize(
          child: Offstage(
            offstage: true,
            child: AppBar(
//                leading: GestureDetector(
//                  child: Icon(Icons.arrow_back),
//                  onTap: (){
//                    Navigator.pop(context);
//                  },
//                ),
//              title: Text('我的',style: TextStyle(color: Colors.white),),
            ),
          ),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        ),
      body: _buildBody()
    );
  }

  Widget _buildBody(){
    return Container(
      child: Column(
        children: [
          Container(
            child:Column(
              children: [
                Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ],
            )
          ),
         Container(
           height: ScreenAdaper.width(820),

           child:  ListView.builder(
             itemCount: 10,
             itemBuilder: (ctx,index){
               return _buildWidgetByIndex(context,index);
             },
           ),
         ),
        ],
      ),
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
          child: Row(
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
          )
        ),
        onTap: (){
        },
      ),
    );
  }
}
