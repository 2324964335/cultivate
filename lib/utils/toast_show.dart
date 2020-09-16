import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class ToastShow {

  ///弹出普通信息
  static show(String message){
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );
  }
}