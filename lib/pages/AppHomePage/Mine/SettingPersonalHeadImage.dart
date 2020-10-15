import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/images_picker/images_gridview_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../../../components/images_picker/my_iamge.dart';
import 'package:uuid/uuid.dart';
class SettingPersonalHeadImage extends StatefulWidget {
  SettingPersonalHeadImage({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _SettingPersonalHeadImageState createState() => _SettingPersonalHeadImageState();
}

class _SettingPersonalHeadImageState extends State<SettingPersonalHeadImage> {

  List<MyImage> images = List<MyImage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置个人头像'),),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx,index){
              return _buildItem();
            }),
      ),
    );
  }

  Widget _buildItem(){
    Asset asset = null;
    if(images.length > 0){
      asset = getMyImageByuuid(images[0].uuid).asset;
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: Column(
        children: [
          /*
          AssetThumb(
      asset: asset,
      //fit: BoxFit.cover,
      width: ScreenAdaper.width(750),
      height: ScreenAdaper.width(750),
    ),
          * */
          images.length==1?AssetThumb(
                            asset: asset,
                              //fit: BoxFit.cover,
                              width: 375,
                              height: 375,
                            ):
                              Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(750),height: ScreenAdaper.width(750),fit: BoxFit.fill,),
          SizedBox(height: ScreenAdaper.width(30),),
          GestureDetector(
            child:
            new ClipRRect(

              borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
              child:
              Container(
                height: ScreenAdaper.width(90),
                width: ScreenAdaper.width(540),
                alignment: Alignment.center,
                color: Color(0xFF00D08D),
                child: Text("从相册选一张",style: TextStyle(color: Colors.white),),
              ),
            ),
            onTap: loadImages
          ),
          SizedBox(height: ScreenAdaper.width(40),),
          GestureDetector(
            child:
            new ClipRRect(

              borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
              child:
              Container(
                height: ScreenAdaper.width(90),
                width: ScreenAdaper.width(540),
                alignment: Alignment.center,
                color: Color(0xFFF1B900),
                child: Text("拍一张照片",style: TextStyle(color: Colors.white),),
              ),
            ),
            onTap: loadImages
          ),
        ],
      )
    );
  }

  MyImage getMyImageByuuid(String uuid){

    for(int i=0;i<images.length;++i){
      if(images[i].uuid.compareTo(uuid)==0){
        return images[i];
      }
    }

    return null;
  }



  Future<void> loadImages() async {
//    if (images.length >= 1) {
//      ToastShow.show("最多只能上传一张图片");
//      return;
//    }
    List<Asset> resultList;
//    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1 - images.length,
        enableCamera: true,

      );
    } on Exception catch (e) {
    }
    if (!mounted) return;

    if(resultList==null) return;
    setState(() {
      images = [];
      for(Asset asset in resultList){
        String uuid = Uuid().v1();
        images.add(MyImage(asset,uuid));
      }
      LogUtil.d(images);
    });
  }
}
