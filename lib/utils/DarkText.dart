
import 'screen_adaper.dart';
import 'package:flutter/material.dart';
class DarkText {
  static build(String text){
    return Text(text,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25)),);
  }

  static buildBold(String text){
    return Text(text,style: TextStyle(color: Color(0xff565656),fontSize: ScreenAdaper.sp(25),fontWeight: FontWeight.bold),);
  }
}