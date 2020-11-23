import 'package:flutter/material.dart';
import '../../../utils/util.dart';
//import 'home_request/HomeRequest.dart';
import '../../../components/text_field.dart';
//import 'home_request/home_page_data_entity.dart';
import './contact_request/contact_list_entity.dart';
class ContactSearch extends StatefulWidget {
  ContactSearch({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  //用于焦点
  final FocusNode _inputNode = FocusNode();
  TextEditingController _inputController = TextEditingController();
  ContactListEntity _totalData = null;

  List _dataList_search = [];
  List _dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _totalData = this.widget.params["params"];
    _totalData.data[0].xList.forEach((element) {
      element.empInfo[0].empList.forEach((elemente) {
        elemente.wardName = element.wardName;
        _dataList.add(elemente);
      });
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('通讯录人员搜索'),),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:
          Container(
              child:
                ListView.builder(
                    itemCount: _dataList_search.length==0?2:_dataList_search.length + 1,
//                    physics: new AlwaysScrollableScrollPhysics(),
                    itemBuilder: (ctx,index){
                      return _buildByIndex(context, index);
                    }
                ),
          ),
        )
    );
  }

  Widget _buildByIndex(BuildContext context,int index){
    if(index == 0){
      return _buildHeader(context, index);
    }else{
      if(_dataList_search.length == 0){
        return _buildGNoData(context);
      }else{
        return _buildItem(context, index -1);
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

  Widget _buildHeader(BuildContext context,int index){
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
            child:Container(
              height: ScreenAdaper.width(84),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: Colors.grey,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenAdaper.width(14),),
                      Container(
                        width: ScreenAdaper.width(500),
                        height: ScreenAdaper.width(70),
                        padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
                        child: MyTextField(
                          focusNode: _inputNode,
                          placeHolder: '请输入需要搜索的内容',
                          maxLength: null,
                          noBottomLine: true,
                          keyboardType: TextInputType.multiline,
                          controller: _inputController,
                          isMultiHang: false,
                        ),
                      ),
                    ],
                  ),
//                Container(
//                  width: ScreenAdaper.width(500),
//                  padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
//                  child: MyTextField(
//                    focusNode: _inputNode,
//                    placeHolder: '请输入需要搜索的内容',
//                    maxLength: null,
//                    noBottomLine: true,
//                    keyboardType: TextInputType.multiline,
//                    controller: _inputController,
//                    isMultiHang: false,
//                  ),
//                ),
                  SizedBox(width: ScreenAdaper.width(10),),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenAdaper.width(60),
                    width: ScreenAdaper.width(120),
                    child: OutlineButton(
                      child: Text('确定',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(23)),maxLines: 1,),
                      onPressed: (){
                        LogUtil.d('------');
                        _dataList_search = [];
                        FocusScope.of(context).requestFocus(FocusNode());
//                        _dataList = null;
                      _dataList.forEach((element) {
                        if((element as ContactListDataListEmpInfoItem).name.contains(_inputController.text)){
                          _dataList_search.add(element);
                        }
                      });
                      if(_dataList_search.length == 0){
                        ToastShow.show('暂未搜索到与此关键字匹配的人员');
                      }
                        setState(() {
                        });
                      },
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    ContactListDataListEmpInfoItem item = _dataList_search[index];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: ScreenAdaper.width(20),),

//                        ClipOval(
//                          child: Container(
//                            color: Colors.lightBlueAccent,
//                            width: ScreenAdaper.width(90),
//                            height: ScreenAdaper.width(90),
//                          ),
//                        ),
                        CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(90),height: ScreenAdaper.width(90),fit: BoxFit.contain,),
//                        Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(90),height:ScreenAdaper.width(90),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text(item.name,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                        SizedBox(width: ScreenAdaper.width(15),),
                        Text(item.wardName,style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                      ],
                    ),
                    Container(
//                      margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
//                      child:Text("2020-07-20 14:20",style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenAdaper.height(20),),
              Container(
                width: ScreenAdaper.width(720),
                height: ScreenAdaper.height(1),
                color: Color(0xffe7e7e7),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.pushNamed(
            context,
            '/collegeInfomation',
            arguments: {'info':item}, //　传递参数
          );
        },
      ),
    );
  }
}
