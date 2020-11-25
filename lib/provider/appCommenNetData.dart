import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
//import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_request.dart';
import '../utils/LoginModel.dart';
import '../utils/storage.dart';
//import '../pages/AppHomePage/MyPersonal/RelatedObject_request/related_object_list_entity.dart';
//import '../pages/AppHomePage/MyPersonal/RelatedObject_request/RelatedObjectRequest.dart';
// Provider状态管理使用
//class ServiceItemList with ChangeNotifier {
//  List<HomeItem> _serviceList = [];
//
//  List<HomeItem> get getserviceList => _serviceList;
//
//  void getServiceItemsList(){
//    HomeItemsRequest.requestHomeItemsData().then((res){
//      _serviceList = [];
//      _serviceList.addAll(res);
//      notifyListeners();
//    });
//  }
////  ServiceItemList get serviceList => _serviceList;
//
//  ///服务列表点击index
//  int _currenClickIndex = 0;
//  int get getCurrentCllickIndex => _currenClickIndex;
//  void setCurrentClickIndex(int index){
//    _currenClickIndex = index;
//    notifyListeners();
//  }
//}

class GainUserModel with ChangeNotifier{

  dynamic _userModel = null;

  dynamic get getuserModel => _userModel;

  void setCurrenUserModel(){
    var m = StorageUtil().getUserModel();
    if (m != null){
      _userModel = m;
      Future.delayed(Duration(milliseconds: 50)).then((e) {
        notifyListeners();
      });
    }else{
      _userModel = 0;
      Future.delayed(Duration(milliseconds: 50)).then((e) {
        notifyListeners();
      });
    }
  }

  bool getIsLogin(){
    if(_userModel == 0||this == null){
      return false;
    }else{
      return true;
    }
  }
}


//class GainRelationObjectList with ChangeNotifier{
//
//  RelatedObjectListEntity _relateListModel = null;
//
//  RelatedObjectListData _selectItemData = null;
//
//  RelatedObjectListData get getSelectRelationModel => _selectItemData;
//
//
//  RelatedObjectListEntity get getRelateListModel => _relateListModel;
//
//  void setSelectRelationModel(RelatedObjectListData model){
//    _selectItemData = model;
//    notifyListeners();
//  }
//
//  void setRelationList(){
//    final model = StorageUtil().getUserModel();
//    if (model != null) {
//      RelatedObjectRequest.requestRelatedObjectList((model as UserModel).token).then((value){
//        _relateListModel = value;
//        notifyListeners();
//      });
//    }
//  }
//}