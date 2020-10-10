class Question{
  String itemid;
  String catid;
  String grade;
  int questionIndex;
  String title = ' 发挥药效最快的给药途径是什么？';
  int answer = 0;
  bool isSingQuestion = true;
  bool iscorrect;
  bool isSelect = false;
  int myanswer;
  String describe = '这是这道题的错误分析';
  String hits;
  String addtime;
  String thumb;
  String catname;
  List answers=['口服','皮下注射','吸入疗法','静脉注射'];
  String clickLabel;
}