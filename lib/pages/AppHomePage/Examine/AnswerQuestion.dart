import 'package:cultivate/main.dart';
import 'package:cultivate/pages/AppHomePage/Home/Home.dart';
import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'AnswerQuestionBottomTool.dart';
import 'QuestionProvider.dart';
import 'package:provider/provider.dart';
import 'QuestionModel.dart';
import 'QuestionSliverControllProvider.dart';
import 'QuestionPageChangeMiddle.dart';
import '../Home/home_request/HomeRequest.dart';
import 'home_question_model_entity.dart';
class AnswerQuestion extends StatefulWidget {
  AnswerQuestion({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _AnswerQuestionState createState() => _AnswerQuestionState();
}

class _AnswerQuestionState extends State<AnswerQuestion> {

  QuestionProvider _questionProvider;
  SliverDrawBottomControll _sliverDrawBottomControll;
  QuestionSliverControllProvider _questionSliverControllProvider;

  double alpha = 0;
  bool isAllowShow = true;
  bool isAllowClick = false;
  HomeQuestionModelEntity _data = null;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuestionList();
  }

  void getQuestionList(){
    Map params = {
      "sheetcode":this.widget.params["sheetcode"],
      "type":this.widget.params["isTotal"]=='1'?0:1,
      "singleSelNum":10,
      "multiSelNum":10,
      "judgeSelNum":10
    };

    HomeRequest.requestQuestion(StorageUtil().getSureUserModel().TokenID, params).then((value){
        _questionProvider.setQuestListData([]);
        _data = value;
//        setState(() {
//        });
      if(_questionProvider.getQuestionList.length == 0&&_data != null){
        List<Question> questionList = [];
        for (int i = 0;i < _data.xList.length;i++){
          HomeQuestionModelList yuanmodel = _data.xList[i];
          Question m = Question();
          m.questionIndex = i + 1;
          m.title = yuanmodel.title;
          m.answers = yuanmodel.answer;
          m.iD = yuanmodel.iD;
          m.type = yuanmodel.type;
          m.correctAnswer = yuanmodel.correctAnswer;
          if(yuanmodel.type==0||yuanmodel.type == 2){
            if(yuanmodel.correctAnswer=='A'){
              m.answer = 0;
            }else if(yuanmodel.correctAnswer=='B'){
              m.answer = 1;
            }else if(yuanmodel.correctAnswer=='C'){
              m.answer = 2;
            }else if(yuanmodel.correctAnswer=='D'){
              m.answer = 3;
            }else if(yuanmodel.correctAnswer=='E'){
              m.answer = 4;
            }else if(yuanmodel.correctAnswer=='F'){
              m.answer = 5;
            }
          }
          questionList.add(m);
        }
        _questionProvider.setQuestListData(questionList);
      }
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    LogUtil.d('----------------------重绘');
    _questionProvider = Provider.of<QuestionProvider>(context);
    _sliverDrawBottomControll = Provider.of<SliverDrawBottomControll>(context);
    _questionSliverControllProvider = Provider.of<QuestionSliverControllProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('答题'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _questionProvider.getQuestionList.length == 0?Container():
          QuestionPageChangeMiddle(
            controll: _questionSliverControllProvider,
          ),
          isAllowShow
              ? SizedBox()
              : GestureDetector(
            onTap: isAllowClick
                ? () {
              print('top');
              _sliverDrawBottomControll.shrink();
            }
                : null,
            child: TestAlphaWidget(Container(
              color: Colors.black38,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnswerQuestionBottomTool(_questionProvider.getQuestionList, (int index) {
              _questionProvider.current = index;
              _questionProvider.notifyListeners();
            }, (double veOffset) {
              alpha = 1 - veOffset / (ScreenAdaper.height(700) - ScreenAdaper.height(100));
//              _questionProvider.changeAlpha(alpha);
              if (alpha == 1) {
                //不透明，不让点击
                isAllowShow = false;
                setState(() {});
              } else if (alpha == 0) {
                isAllowShow = true;
                setState(() {});
              } else {
                if (isAllowShow) {
                  isAllowShow = false;
                  setState(() {});
                }
              }
              if (alpha == 1) {
                isAllowClick = true;
                setState(() {});
              } else {
                if (isAllowClick) {
                  isAllowClick = false;
                  setState(() {});
                }
              }
            }
            ),
          ),
        ],
      ),
    );
  }
}

class TestAlphaWidget extends StatefulWidget {
  Widget child;

  TestAlphaWidget(this.child);

  @override
  State<StatefulWidget> createState() {
    return TestAlphaWidgetState();
  }
}

class TestAlphaWidgetState extends State<TestAlphaWidget> {
  @override
  Widget build(BuildContext context) {
    print('TestAlphaWidgetState Build');
    print('alphaRatio==> ${Provider.of<QuestionProvider>(context).alphaRatio}');
    return Opacity(
      opacity: Provider.of<QuestionProvider>(context).alphaRatio,
      child: widget.child,
    );
  }
}
