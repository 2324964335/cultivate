
import 'screen_adaper.dart';
import 'package:flutter/material.dart';
class Line {
  static build(){
    return Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
            color: Color(0xffE7E7E71),
            height: ScreenAdaper.height(0.5),
            width: ScreenAdaper.width(680),
            );
  }
}