import 'package:flutter/material.dart';

class AppHomePageStore extends ChangeNotifier {
  PageController barTabsController;
  bool _grayTheme = false;
  int _index = 0;

  int get getIndex => _index;

  /// 保存页面控制器
  void saveController(PageController barTabsCont) =>
      barTabsController = barTabsCont;

  /// 获取BarTabs的Controller控制器
  PageController get getBarTabsCont => barTabsController;

//  void setTabbarIndex(int index){
//    _index = index;
//    notifyListeners();
//  }

  /// 是否显示灰度模式主题，true为灰度, false显示原有主题颜色
  bool setGrayTheme([bool flag = false]) {
    _grayTheme = flag;
    notifyListeners();
    return _grayTheme;
  }

  /// 是否是灰度模式
  bool get getGrayTheme => _grayTheme;
}
