import 'package:ota_update/generated/i18n.dart';

class Question{
  int iD;
  String catid;
  String grade;
  int questionIndex;
  String title = '';
  int answer = 0;
  String correctAnswer = '';
  bool isSingQuestion = true;
  int type = 0;
  bool iscorrect;
  bool isSelect = false;
  int myanswer;
  String describe = '';
  String hits;
  String addtime;
  String thumb;
  String catname;
  List answers =[];
  String clickLabel;
}