import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import './contact_request/contact_list_entity.dart';

class ContactList extends StatefulWidget {
  ContactList({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.params["wardName"]),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return _buildItem(context,index);
        },
        itemCount: (this.widget.params["list"] as List).length,
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    ContactListDataListEmpInfoItem item = (this.widget.params["list"] as List)[index];
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
                        Text(this.widget.params["wardName"],style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),),
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
