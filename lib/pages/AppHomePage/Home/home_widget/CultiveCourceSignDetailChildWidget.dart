import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import '../home_request/HomeRequest.dart';
import '../home_request/my_cultivate_detail_bottom_person_list_entity.dart';
class CultiveCourceSignDetailChildWidget extends StatefulWidget {
  Map params;
  CultiveCourceSignDetailChildWidget(this.params);
  @override
  _CultiveCourceSignDetailChildWidgetState createState() => _CultiveCourceSignDetailChildWidgetState();
}

class _CultiveCourceSignDetailChildWidgetState extends State<CultiveCourceSignDetailChildWidget> {

  MyCultivateDetailBottomPersonListEntity _data = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map params = {
      "id":this.widget.params["id"],
      "type":0,
      "pageIdx":1,
      "pageSize":10
    };
    HomeRequest.requestMyCultivateSignBottomFeiLei(StorageUtil().getSureUserModel().TokenID, params).then((value){
        _data = value;
        setState(() {
        });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView.builder(
          itemCount: _data==null?0:_data.xList.length,
          itemBuilder: (ctx, index) {
            return _buildItem(context,index);
          }
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    MyCultivateDetailBottomPersonListList item = _data.xList[index];
    return Container(
      padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
      child: GestureDetector(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: ScreenAdaper.width(20),),

//                      ClipOval(
//                        child: Container(
//                          color: Colors.lightBlueAccent,
//                          width: ScreenAdaper.width(90),
//                          height: ScreenAdaper.width(90),
//                        ),
//                      ),
                      CachedNetworkImage(imageUrl: item.icon,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.width(90),height: ScreenAdaper.width(90),fit: BoxFit.contain,),
//                      Image.asset("asset/images/mine/touxiang.png",width: ScreenAdaper.width(90),height:ScreenAdaper.width(90),),
                      SizedBox(width: ScreenAdaper.width(15),),
                      Text(item.name,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(30)),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdaper.width(20)),
                    child:Text("签到时间:"+'${item.tsSignin}',style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
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
        onTap: (){
            Navigator.pushNamed(
              context,
              '/cultiveSignQrcode',
              arguments: {}, //　传递参数
            );

        },
      ),
    );
  }
}
