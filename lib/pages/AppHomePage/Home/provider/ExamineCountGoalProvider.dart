import 'package:flutter/material.dart';

class ExamineCountGoalProvider with ChangeNotifier {

    List _totalList = [
      {
        "id":"0",
        "title":"素质要求",
        "subTitle":"仪表大方，素质端庄，语言柔和、恰当",
        "goal":"5",
        "isSelect":0
      },
      {
        "id":"1",
        "title":"评估",
        "subTitle":"检查药品有无过期",
        "goal":"10",
        "isSelect":0
      },
      {
        "id":"2",
        "title":"素质要求",
        "subTitle":"检查无菌药品有效期，消毒效果，完整，无潮湿",
        "goal":"5",
        "isSelect":0
      },
      {
        "id":"3",
        "title":"操作前准备",
        "subTitle":"洗手、戴口罩、备齐用物，放置合理",
        "goal":"10",
        "isSelect":0
      },
      {
        "id":"4",
        "title":"素质要求4134",
        "subTitle":"仪表大方，语言柔和、恰当321",
        "goal":"5",
        "isSelect":0
      },
      {
        "id":"5",
        "title":"评估12321",
        "subTitle":"检查药品有无过期321321",
        "goal":"100",
        "isSelect":0
      },
      {
        "id":"6",
        "title":"素质要求324234",
        "subTitle":"消毒效果，完整，无潮湿",
        "goal":"5",
        "isSelect":0
      },
      {
        "id":"7",
        "title":"操作前准备2121",
        "subTitle":"洗手、戴口罩212121，放置合理",
        "goal":"20",
        "isSelect":0
      },
    ];

    List _selectList = [];

    List get getToTalList => _totalList;

    List get getList => _selectList.length == 0?_totalList:_selectList;

    void changeSelectList(int index,bool isSelect){
      _selectList = List.from(_totalList);
      Map dic = _selectList[index];
      if(isSelect == true){
        dic["isSelect"] = 1;
      }else{
        dic["isSelect"] = 0;
      }
      _totalList = _selectList;
      notifyListeners();
    }

    void clearSelectList(){
      _selectList.forEach((element) {
        element["isSelect"] = 0;
      });
    }

}