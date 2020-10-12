import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'AnswerQuestionBottomTool.dart';
import 'QuestionProvider.dart';
import 'package:provider/provider.dart';
import 'QuestionModel.dart';
import 'QuestionSliverControllProvider.dart';
import 'QuestionPageChangeMiddle.dart';
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
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
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
    if(_questionProvider.getQuestionList.length == 0){
    List<Question> questionList = [];
    for (int i = 0;i < 100;i++){
      Question m = Question();
      m.questionIndex = i + 1;
      questionList.add(m);
    }
    _questionProvider.setQuestListData(questionList);
    }
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
