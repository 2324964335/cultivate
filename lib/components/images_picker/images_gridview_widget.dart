import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'my_iamge.dart';
import 'package:uuid/uuid.dart';
import '../../utils/util.dart';

class ImagesGridviewWidget extends StatefulWidget {

  final Function(List imageList) onSelectedImageList;

  ImagesGridviewWidget(
      {Key key,
        this.onSelectedImageList})
      :super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagesGridviewWidgetState();
  }
}

class ImagesGridviewWidgetState extends State<ImagesGridviewWidget> {
  List<MyImage> images = List<MyImage>();


  String _movingValue; // 记录正在移动的值

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var gradWidth = width - 30; //9宫格的大小
    var itemWidth = gradWidth / 3; //某张图片拖动时 的大小

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 30),
      width: gradWidth,
      height: images.length<3?itemWidth:itemWidth*2,
//              color: Colors.green,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1),
        children: buildItems(itemWidth),
        physics: NeverScrollableScrollPhysics(), //禁止滚动
      ),
    );
  }

  // 生成GridView的items
  List<Widget> buildItems(var itemWidth) {
    List<Widget> items = List<Widget>();
    images.forEach((myimage) {
      items.add(draggableItem(itemWidth, myimage.uuid));
    });
    items.add(pickerImageButton(
      itemWidth,
    ));
    return items;
  }

  // 生成可拖动的item
  Widget draggableItem(itemWidth, value) {
    return Draggable(
      data: value,
      child: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return baseItem(itemWidth, value, Colors.white);
        },
        onWillAccept: (moveData) {
//          print('=== onWillAccept: $moveData ==> $value');

          var accept = moveData != null;
          if (accept) {
            exchangeItem(moveData, value, false);
          }
          return accept;
        },
        onAccept: (moveData) {
//          print('=== onAccept: $moveData ==> $value');
          exchangeItem(moveData, value, true);
        },
        onLeave: (moveData) {
//          print('=== onLeave: $moveData ==> $value');
        },
      ),
      feedback: baseItem(itemWidth, value, Colors.white.withOpacity(0.8)),
      childWhenDragging: null,
      onDragStarted: () {
//        print('=== onDragStarted');
        setState(() {
          _movingValue = value;
        });
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
//        print('=== onDraggableCanceled');
        setState(() {
          _movingValue = null;
        });
      },
      onDragCompleted: () {
//        print('=== onDragCompleted');
      },
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

  // 基础展示的item 此处设置width,height对GridView 无效，主要是偷懒给feedback用
  Widget baseItem(itemWidth, value, bgColor) {
    if (value == _movingValue) {
      return Container();
    }

    Asset asset = getMyImageByuuid(value).asset;

    return Container(
      width: itemWidth,
      height: itemWidth,
      color: bgColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
        AssetThumb(
        asset: asset,
          //fit: BoxFit.cover,
        width: 500,
        height: 500,
      ),

    new Positioned(
    right: 0.08,
    top: 0.08,
    child: new GestureDetector(
//                onTap: onCancel,
    child: new Container(
    decoration: new BoxDecoration(
    color: Colors.black45,
    shape: BoxShape.circle,
    ),
    child: GestureDetector(
    onTap: () {
    setState(() {
    images.remove(getMyImageByuuid(value));
    });
    },
    child: new Icon(
    Icons.close,
    color: Colors.white,
    size: 20.0,
    ),
    )),
    ),
    ),
    ],
    )
    ,

//        child: Text(
//          value,
//          textAlign: TextAlign.center,
//          style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 20,
//              color: Colors.yellowAccent),
//        ),
    );
  }

  // 重新排序
  void exchangeItem(moveData, toData, onAccept) {
    setState(() {

      MyImage tomyImage =  getMyImageByuuid(toData);
      var toIndex = images.indexOf(tomyImage);

      MyImage movemyImage =  getMyImageByuuid(moveData);

      images.remove(movemyImage);
      images.insert(toIndex, movemyImage);

      if (onAccept) {
        _movingValue = null;
      }
    });
  }

  Widget pickerImageButton(itemWidth,) {
    return GestureDetector(
        onTap: loadImages,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: itemWidth,
          height: itemWidth,
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: itemWidth / 2,
              ),
              Text(
                "照片/拍摄",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ));
  }

   Future<void> loadImages() async {
    if (images.length >= 1) {
      ToastShow.show("最多只能上传四张图片");
      return;
    }
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
      for(Asset asset in resultList){
        String uuid = Uuid().v1();
        images.add(MyImage(asset,uuid));
      }
      widget.onSelectedImageList(images);
    });
  }

}
