import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'package:provider/provider.dart';
import 'provider/ExamineCountGoalProvider.dart';
import 'home_request/HomeRequest.dart';
import 'home_request/home_total_operation_examine_list_model_entity.dart';
import 'home_request/OperationModel.dart';
class ExamineDoctorTotalForm extends StatefulWidget {
  ExamineDoctorTotalForm({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _ExamineDoctorTotalFormState createState() => _ExamineDoctorTotalFormState();
}

class _ExamineDoctorTotalFormState extends State<ExamineDoctorTotalForm> {

  ExamineCountGoalProvider _examineCountGoalProvider;
  HomeTotalOperationExamineListModelEntity _totalData = null;
  List _dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getAllOperationSheet();
  }
  void getAllOperationSheet(){
    List totalList = [];
    HomeRequest.requestTotalOperationExamineList(StorageUtil().getSureUserModel().TokenID, {"sheetCode":this.widget.params["sheetCode"]}).then((value){
      _totalData = value;
      _totalData.xList.forEach((element) {
        element.item.forEach((elementItem) {
          OperationModel model = OperationModel();
          model.sheetCode = element.sheetCode;
          model.itemCode = element.itemCode;
          model.caption = element.caption;
          model.iD = elementItem.iD;
          model.optionOrd = elementItem.optionOrd;
          model.optionText = elementItem.optionText;
          model.weightedValue = elementItem.weightedValue;
          totalList.add(model);
        });
      });
      _examineCountGoalProvider.setTotalList(totalList);
    });
  }

  @override
  Widget build(BuildContext context) {
    _examineCountGoalProvider = Provider.of<ExamineCountGoalProvider>(context);
    if(_examineCountGoalProvider.getList.length == 0){
//      _serviceItemListProvider.getServiceItemsList();
        getAllOperationSheet();
    }else{
        _dataList = _examineCountGoalProvider.getList;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("扣分项"),
      ),
      body: Stack(
        children: [
          Positioned(
              child:
              Container(
                child:
                ListView.builder(
                    itemCount: _dataList.length,
                    itemBuilder: (ctx, index) {
                      return _buildItem(context, index);
                    }
                ),
              ),
              left: 0,
              bottom: ScreenAdaper.height(201),
              right: 0,
              top: 0),
          Positioned(
            child: _buildBottomTool(),
            left: 0,
            bottom: 0,),
        ],
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    OperationModel item = _dataList[index];
      return Container(
        margin: EdgeInsets.all(ScreenAdaper.width(20)),
        color: Colors.white,
        child: GestureDetector(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.width(20)),
                  child: Text(item.caption),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        new Checkbox(
                          value: item.isSelect==0?false:true,
                          activeColor: Colors.orange,
                          onChanged: (bool val) {
                            // val 是布尔值
//                    setState(() {
//                      _isYizhu = !_isYizhu;
//                    });
                            _examineCountGoalProvider.changeSelectList(index, val);
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(top: ScreenAdaper.width(10)),
                          width: ScreenAdaper.width(500),
                          child: Text(item.optionText,style: TextStyle(color: Color(0xff9e9a9a),fontSize: ScreenAdaper.sp(25)),maxLines: 10,strutStyle: StrutStyle(forceStrutHeight: true, height:0.5, leading: 1),),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
                      child: Text("-${item.weightedValue}",style: TextStyle(color: Colors.red,fontSize: ScreenAdaper.sp(26)),
                    ),)
                  ],
                ),
              ],
            ),
            color: Colors.white,
          ),
          onTap: (){
            LogUtil.d('-----------');
            _examineCountGoalProvider.changeSelectList(index, (_examineCountGoalProvider.getList[index] as OperationModel).isSelect==0?true:false);
          },
        ),
      );
  }


  Widget _buildBottomTool(){
    return Container(
//      margin: EdgeInsets.only(left: 0,right: 0),
        color: Colors.transparent,
        width: ScreenAdaper.width(745),
        height: ScreenAdaper.height(200),
        alignment: Alignment.center,
        child: GestureDetector(
          child:
          new ClipRRect(

            borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
            child:
            Container(
              height: ScreenAdaper.width(90),
              width: ScreenAdaper.width(640),
              alignment: Alignment.center,
              color: Color(0xFF00D08D),
              child: Text("完成",style: TextStyle(color: Colors.white),),
            ),
          ),
          onTap: (){
            LogUtil.d('-------去签到');
            Navigator.pop(context);
          },
        )
    );
  }
}
