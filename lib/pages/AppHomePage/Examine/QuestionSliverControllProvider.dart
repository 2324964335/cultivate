import 'package:flutter/material.dart';


enum SliverSelf{
  next,
  init,
  previous,
}

class QuestionSliverControllProvider extends ChangeNotifier{
  SliverSelf self = SliverSelf.init;

  void next(){
    this.self = SliverSelf.next;
    notifyListeners();
  }

  void previous(){
    this.self = SliverSelf.previous;
    notifyListeners();
  }
}