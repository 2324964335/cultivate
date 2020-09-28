
import 'screen_adaper.dart';
import 'package:flutter/material.dart';
class LightText {
  static build(String text){
    return Text(text,style: TextStyle(color: Color(0xff9E9A9A),fontSize: ScreenAdaper.sp(25)),);
  }
}