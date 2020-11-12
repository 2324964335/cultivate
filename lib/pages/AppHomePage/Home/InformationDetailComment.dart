//InformationDetailComment
import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../../../components/text_field.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/information_detail_comment_model_entity.dart';

class InformationDetailComment extends StatefulWidget {
  InformationDetailComment({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _InformationDetailCommentState createState() => _InformationDetailCommentState();
}

class _InformationDetailCommentState extends State<InformationDetailComment> {

  //用于焦点
  final FocusNode _inputNode = FocusNode();
  TextEditingController _inputController = TextEditingController();
  ScrollController _scrollController = ScrollController(); //listview的控制器
  InformationDetailCommentModelEntity _dataTotal = null;
  List _dataTotal_list = [];
  bool canContinueLoading = true;
  int PageIndex = 1;
  bool _isZan = false;

  void upLoadSee(){
    if(this.widget.params['st_see'] == 0){
      Map params = {
        "id":this.widget.params["id"].trim(),
        "ST_see":0
      };
      HomeRequest.requestHomeItemDetailSee(StorageUtil().getSureUserModel().TokenID, params).then((value){
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopData();
//    getListData(1);
//    upLoadSee();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        getListData(PageIndex);
      }
    });
  }

  void getTopData(){
    HomeRequest.requestHomeItemDetailTop(StorageUtil().getSureUserModel().TokenID, {}, this.widget.params['id'].trim()).then((value){
      LogUtil.d('-------');
    });
  }


  void getListData(int pageIndex){
    if(pageIndex!=1&&canContinueLoading == false){
      ToastShow.show('暂无更多数据');
      return;
    }
    Map params = {
//      'linkId':this.widget.params['id'],
      'pageIdx':pageIndex,
      'pageSize':10
    };
    HomeRequest.requestHomeItemDetail(StorageUtil().getSureUserModel().TokenID,params,this.widget.params['id'].trim()).then((value){
      _dataTotal = value;
      if(pageIndex==1){
        LogUtil.d('----3');
        _dataTotal_list = [];
        _dataTotal = value;
        _dataTotal_list.addAll(value.data.xList);
        canContinueLoading = true;
      }else{
        if((value.data.xList as List).length > 0) {
          LogUtil.d('----2');
          _dataTotal_list.addAll(value.data.xList);
        }
        if((value.data.xList as List).length < 10){
          canContinueLoading = false;
        }
      }
      if(_dataTotal.data.sT_MyLike == 1){
        _isZan = true;
      }else{
        _isZan = false;
      }
      setState(() {
      });
      PageIndex +=1;
    });
  }

  Future<Null> _handleRefresh() async {
    PageIndex = 1;
    getListData(PageIndex);
  }

  void _dianZan(){
    if(_isZan==true){
      ToastShow.show('您已经赞过了！');
      return;
    }
    Map params = {
      "id":this.widget.params["id"].trim(),
      "ST_like":0
    };
     HomeRequest.requestHomeItemDetailZan(StorageUtil().getSureUserModel().TokenID, params).then((value){
       if(value["success"] == 1){
         ToastShow.show('点赞成功');
         _isZan = true;
         setState(() {
         });
       }else{
         ToastShow.show('点赞失败');
       }
     });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('公告'),),
      body: GestureDetector(
        child: Container(
            child:
            Stack(
              children: [
                Positioned(
                    child:
                    Container(
                      child:
                      RefreshIndicator(
                        onRefresh: _handleRefresh,
                        child:
                      ListView.builder(
                        controller: _scrollController,
                        physics: new AlwaysScrollableScrollPhysics(),
                        itemCount: _dataTotal == null?0:_dataTotal_list.length + 1,
                        itemBuilder: (ctx,index){
                          return _buildItemByIndex(context, index);
                        },
                      ),
                      )
                    ),
                    left: 0,
                    bottom: ScreenAdaper.height(101),
                    right: 0,
                    top: 0),
                Positioned(
                  child: _buildBottomTool(),
                  left: 0,
                  bottom: 0,),
              ],
              alignment: Alignment.center,
            )
        ),
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      )
    );
  }

  Widget _buildItemByIndex(BuildContext context,int index){
    if(index == 0){
      if(_dataTotal_list.length == 0){
        return Column(
          children: [
            _buildHeaderItem(context, index),
            _buildZanwu(context, index)
          ],
        );
      }else{
        return _buildHeaderItem(context, index);

      }
    }else{
      return _buildItem(context, index-1);
    }
  }

  Widget _buildZanwu(BuildContext context,index){
    return Container(
      alignment: Alignment.center,
//      width: ScreenAdaper.width(750),
      height: ScreenAdaper.height(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/images/home/zanwupinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.width(30),),
          LightText.build('暂无评论'),
        ],
      ),
    );
  }

  Widget _buildBottomTool(){
    return Container(
//      margin: EdgeInsets.only(left: 0,right: 0),
        color: Colors.transparent,
        width: ScreenAdaper.width(745),
        height: ScreenAdaper.height(100),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: ScreenAdaper.width(500),
              padding: EdgeInsets.only(left: ScreenAdaper.width(100)),
              child: MyTextField(
                focusNode: _inputNode,
                placeHolder: '说点什么...',
                maxLength: null,
                noBottomLine: true,
                keyboardType: TextInputType.multiline,
                controller: _inputController,
                isMultiHang: false,
              ),
            ),
            SizedBox(width: ScreenAdaper.width(10),),
            GestureDetector(
              child: Image.asset(_isZan==true?"asset/images/home/yidianzan.png":"asset/images/home/dianzan.png",width: ScreenAdaper.width(30),height: ScreenAdaper.width(30),),
              onTap: (){
                _dianZan();
              },
            ),
            SizedBox(width: ScreenAdaper.width(30),),
            Container(
              alignment: Alignment.center,
              width: ScreenAdaper.width(120),
              child: OutlineButton(
                child: Text('发送',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(23)),maxLines: 1,),
                onPressed: (){
                  LogUtil.d('------');
                  requestComment();
                },
              ),
            )
          ],
        )
    );
  }

  void requestComment(){
    if(_inputController.text == ""){
      ToastShow.show('请输入评论内容');
      return;
    }
    Map params = {
      "id":this.widget.params["id"],
      "ST_comment":0,
      "comment":_inputController.text
    };
    HomeRequest.requestHomeItemDetailComment(StorageUtil().getSureUserModel().TokenID, params).then((value){
      LogUtil.d('-----------${value}');
      ToastShow.show(value["msg"]);
      if(value["msg"] == "评论成功"){
        _inputController.text = "";
        getListData(1);
      }
    });
  }

  Widget _buildHeaderItem(BuildContext context,int index){
    InformationDetailCommentModelData data = _dataTotal.data;
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: Column(
        children: [
          Container(
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
                color: Colors.white,
                child: Column(
                  children: [
                    Row(

                      children: [
                        Container(

                          child: Text(data.title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
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
                                CachedNetworkImage(imageUrl: data.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
                                SizedBox(width: ScreenAdaper.width(20),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: ScreenAdaper.height(20),),
                                    Row(
                                      children: [
//                                      SizedBox(width: ScreenAdaper.width(20),),
                                        Text('主讲人：',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                        Text(data.trainer,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                        SizedBox(width: ScreenAdaper.width(30),),
                                        Text('开始时间:',style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
                                        Text(data.beginTime,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                      ],
                                    ),
                                    SizedBox(height: ScreenAdaper.height(20),),
                                    Container(
                                      width: ScreenAdaper.width(580),
                                      child: Text(data.content,style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),maxLines: 100,),
                                    ),
                                    SizedBox(height: ScreenAdaper.height(20),),
                                    Row(
                                      children: [
//                                        SizedBox(width: ScreenAdaper.width(20),),

                                        Text('学时：',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                                        SizedBox(width: ScreenAdaper.height(10),),
                                        Text('${data.traineeScore}课时',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
                                      ],
                                    ),
                                    SizedBox(height: ScreenAdaper.height(20),),
                                    data.status == 0?Column(
                                      children: [
                                        Row(
                                          children: [
//                                            SizedBox(width: ScreenAdaper.width(20),),

                                            Text('地  点',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                                            SizedBox(width: ScreenAdaper.height(10),),

                                            Text(data.address,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
                                          ],
                                        ),
                                        SizedBox(height: ScreenAdaper.height(20),),

                                      ],
                                    ):Container(),
                                    Row(
                                      children: [
//                                        SizedBox(width: ScreenAdaper.width(20),),

                                        Text('报名人数',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                                        SizedBox(width: ScreenAdaper.height(10),),

                                        Text('${data.personCount}/${data.personMax}人',style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),),
                                      ],
                                    ),
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
                                                Text(data.likes.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
                                              ],
                                            ),

                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: ScreenAdaper.width(15)),

                                            child: Row(
                                              children: [
                                                Image.asset("asset/images/home/pinglun.png",width: ScreenAdaper.width(30),height: ScreenAdaper.height(30),),
                                                SizedBox(width: ScreenAdaper.width(5),),
                                                Text(data.comments.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
                                                Text(data.seeCount.toString(),style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),)
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
            ),
          ),
          Container(
            child: Text("评论",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:ScreenAdaper.sp(30)),),
            margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(30),bottom: ScreenAdaper.height(16)),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    InformationDetailCommantModelDataList item = _dataTotal_list[index];
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(0),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(0)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.5), //阴影xy轴偏移量
                  blurRadius: 0.2, //阴影模糊程度
                  spreadRadius: 0.2 //阴影扩散程度
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
                  Container(
                    padding: EdgeInsets.only(left: ScreenAdaper.width(10),top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(

                            children: [
                              CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(75),height: ScreenAdaper.width(75),fit: BoxFit.contain,),
                              SizedBox(width: ScreenAdaper.width(20),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: ScreenAdaper.height(20),),
                                  Row(
                                    children: [
//                                      SizedBox(width: ScreenAdaper.width(20),),
                                      Text(item.name,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                      SizedBox(width: ScreenAdaper.width(290),),
                                      Text(item.tsComment,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                                    ],
                                  ),
                                  SizedBox(height: ScreenAdaper.height(20),),
                                  Container(
                                      width: ScreenAdaper.width(580),
                                      height: ScreenAdaper.height(60),
                                    child:Text(item.comment,style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),maxLines: 2,),
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
//              Navigator.pushNamed(
//                context,
//                '/informationDetail',
//                arguments: {}, //　传递参数
//              );
            },
          ),
        ),
      ),
    );
  }
}
