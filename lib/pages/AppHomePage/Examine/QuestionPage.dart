//import 'prace_test_entity.dart';
import 'package:cultivate/pages/AppHomePage/Examine/QuestionModel.dart';
import 'package:cultivate/utils/screen_adaper.dart';
import 'AnswerQuestion.dart';
import 'QuestionProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//import 'fault_sliver_self_controll.dart';
import 'QuestionSliverControllProvider.dart';
import 'height_width.dart';
import 'QuestionModel.dart';
import '../../../utils/util.dart';

enum QuestionLayer{
  top,
  center,
  bottom,
}

class QuestionPage extends StatefulWidget {
  QuestionLayer questionLayer;
  QuestionSliverControllProvider selfControll;
  QuestionPage(this.questionLayer, {this.selfControll});

  @override
  State<StatefulWidget> createState() {
    return QuestionPageState();
  }
}


class QuestionPageState extends State<QuestionPage> {
  bool _isSelected = false;
  bool _isCorrect = false;
  String clickLabel = '';
  Question question;
  double _imageWith = 49;
  @override
  void initState() {
    super.initState();
  }
  getQuestion(questionIndex){
    question = Provider.of<QuestionProvider>(context).getQuestionList[questionIndex];
    _isCorrect = question.iscorrect;
    _isSelected = question.isSelect;
    clickLabel = question.clickLabel;
  }

  Widget _getImg(String url) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width_10dp),
      width: ScreenUtil().setWidth(750),
      child: Image.network(url, fit: BoxFit.contain,),
    );
  }

  @override
  void didUpdateWidget(QuestionPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.questionLayer == QuestionLayer.top){
      int questionIndex = Provider.of<QuestionProvider>(context).current - 1;
      if(questionIndex == -1){
        return Container();
      }
      getQuestion(questionIndex);
    }else if(widget.questionLayer == QuestionLayer.center){
      int questionIndex = Provider.of<QuestionProvider>(context).current;
      getQuestion(questionIndex);
    }else{
      int questionIndex = Provider.of<QuestionProvider>(context).current + 1;
      if(questionIndex == Provider.of<QuestionProvider>(context).getQuestionList.length){
        return Container();
      }
      getQuestion(questionIndex);
    }

//    return Container(
//      width: ScreenAdaper.width(400),
//      child: Text('hjfdjhdfhhjdfjhdfjhdfjhjhfdjhfdfddfdfdfdfdfdf'),
//    );

    List<Widget> _list = [];
    _list.add(_question());
    _list.add(SizedBox(height: height_10dp,),);
    //存在图片
    if (question.thumb != null && question.thumb != '') {
      _list.add(_getImg(question.thumb));
    }
    //跟随答案数目，此处强制4题
    for (int i = 0; i < question.answers.length; i++) {
      _list.add(_answerSelect(question.answers[i],i));
    }
    
    if(question.type == 1){
      _list.add(
        Container(
          margin: EdgeInsets.only(left: ScreenAdaper.width(180),top: ScreenAdaper.width(20),bottom: ScreenAdaper.width(20)),
          width: ScreenAdaper.width(345),
          height: ScreenAdaper.width(80),
          child: GestureDetector(
            child:
            new ClipRRect(

              borderRadius: BorderRadius.circular(ScreenAdaper.width(45)),
              child:
              Container(
                height: ScreenAdaper.width(90),
                width: ScreenAdaper.width(345),
                alignment: Alignment.center,
                color: Color(0xFF00D08D),
                child: Text("确定",style: TextStyle(color: Colors.white),),
              ),
            ),
            onTap: (){
              LogUtil.d('------');
              if(question.duoUserClickAnswerList.length == 0){
                ToastShow.show('请先选择选项');
                return;
              }
              if(question.selfDuoAnswerString.length > 0){
                ToastShow.show('您已经回答过这道题，请选择其他题作答');
                return;
              }
              clickLabel = '';
               _isSelected = true;
              if(question.duoUserClickAnswerList.contains(0)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'A';
              }
              if(question.duoUserClickAnswerList.contains(1)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'B';

              }
              if(question.duoUserClickAnswerList.contains(2)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'C';

              }
              if(question.duoUserClickAnswerList.contains(3)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'D';

              }
              if(question.duoUserClickAnswerList.contains(4)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'E';

              }
              if(question.duoUserClickAnswerList.contains(5)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'F';
              }
              if(question.duoUserClickAnswerList.contains(6)){
                question.selfDuoAnswerString = question.selfDuoAnswerString + 'G';
              }
          if (question.selfDuoAnswerString == question.correctAnswer) {
            _isCorrect = true;
            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: true);
          } else {
            _isCorrect = false;
            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: false);
          }
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].isSelect = _isSelected;
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].iscorrect = _isCorrect;
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].clickLabel = clickLabel;

          setState(() {});
          //如果答对，延时1S跳到下一问题
          if (_isCorrect) {
            Future.delayed(Duration(milliseconds: 1000), () {
              if( widget.selfControll != null && Provider.of<QuestionProvider>(context,listen: false).current != Provider.of<QuestionProvider>(context,listen: false).getQuestionList.length - 1){
                widget.selfControll.next();
              }
            });
          }
            },
          ),
        )
      );
    }
    //答案A，您选择B
    if (_isSelected && !_isCorrect) {
      _list.add(_correntTrip());
      /* //浅底
      _list.add(Container(
          height: height_5dp,
        color: countTint,
      ));*/
      //标题  试题解析
//      _list.add(Container(
//        margin: EdgeInsets.only(left: width_10dp, bottom: height_10dp, top: ScreenAdaper.width(16)),
//        alignment: Alignment.centerLeft,
//        child: Row(
//          children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(width_5dp),
//                color: Colors.blueAccent,
//              ),
//              height: height_20dp,
//              width: width_4dp,
//            ),
//            SizedBox(width: width_10dp,),
//            Text('试题详解', style: TextStyle(fontSize: ScreenAdaper.sp(31), fontWeight: FontWeight.bold),)
//          ],
//        ),
//      ));
//      //真正解析
//      _list.add(_questionAnalysis());
    }
    _list.add(Container(
      height: videoFixHeight,
    ));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _list,
        ),
      ),
    );
  }

  Widget _questionAnalysis(){
    return Container(
      padding: EdgeInsets.fromLTRB(width_10dp, height_5dp, width_10dp, height_5dp),
      child: Text(question.describe, style: TextStyle(fontSize: ScreenAdaper.sp(26),), strutStyle: StrutStyle(leading: 0.5),),
    );
  }

  Widget _correntTrip() {
    return Container(
      margin: EdgeInsets.fromLTRB(width_10dp, height_5dp, width_10dp, height_5dp),
      padding: EdgeInsets.fromLTRB(width_15dp, height_7dp, ScreenAdaper.width(20), height_7dp),
      decoration: BoxDecoration(
        color: Color(0XFFF8F6F9),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child:Column(
        children: [
          SizedBox(height: ScreenAdaper.width(20),),
          Row(
            children: <Widget>[
              Text(
                '答案', style: TextStyle(fontSize: ScreenAdaper.sp(26), fontWeight: FontWeight.bold),),
              SizedBox(width: ScreenAdaper.width(14),),
              Text(question.type == 1?question.correctAnswer:question.answers[question.answer],
                style: TextStyle(fontSize: ScreenAdaper.sp(26),color: Colors.blueAccent, fontWeight: FontWeight.bold),),
              SizedBox(width: ScreenAdaper.width(14),),
            ],
          ),
          SizedBox(height: ScreenAdaper.width(20),),
          Row(
            children: [
              Text('您选择',
                style: TextStyle(fontSize: ScreenAdaper.sp(26), fontWeight: FontWeight.bold),),
              SizedBox(width: ScreenAdaper.width(14),),
              Text(question.type == 1?question.selfDuoAnswerString:clickLabel, style: TextStyle(fontSize: ScreenAdaper.sp(26),color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: ScreenAdaper.width(20),),
        ],
      )
    );
  }

  Widget _question() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(
          width_10dp, height_10dp, width_10dp, 0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.width(10)),
            child: Text('           ' + '${question.questionIndex}.'+question.title,
              style: TextStyle(fontSize: ScreenAdaper.sp(27), fontWeight: FontWeight.w300),
              strutStyle: StrutStyle(leading: 1),
            ),
          ),
          Positioned(
            top: ScreenAdaper.width(13),
            left: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  width_7dp, height_4dp, width_7dp, height_4dp),
              margin: EdgeInsets.only(top: ScreenAdaper.width(14)),
              decoration: BoxDecoration(
                color: Color(0xff0676FC),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                    topRight: Radius.circular(3)),
              ),
              child: Text(
                question.type == 0?'单选':question.type==1?'多选':'判断', style: TextStyle(fontSize: ScreenAdaper.sp(20), color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }


  Widget _answerSelect(String answer_str,int index) {
    return !_isSelected ? GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(question.type == 1){
//          clickLabel = answer_str;
//          _isSelected = true;
//          if (clickLabel == question.answers[question.answer]) {
//            _isCorrect = true;
//            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: true);
//          } else {
//            _isCorrect = false;
//            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: false);
//          }
//          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].isSelect = _isSelected;
//          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].iscorrect = _isCorrect;
//          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].clickLabel = clickLabel;
//
//          setState(() {});
//          //如果答对，延时1S跳到下一问题
//          if (clickLabel == question.answers[question.answer]) {
//            Future.delayed(Duration(milliseconds: 1000), () {
//              if( widget.selfControll != null && Provider.of<QuestionProvider>(context,listen: false).current != Provider.of<QuestionProvider>(context,listen: false).getQuestionList.length - 1){
//                widget.selfControll.next();
//              }
//            });
//          }
          if(question.duoUserClickAnswerList.contains(index)){
            question.duoUserClickAnswerList.remove(index);
          }else{
            question.duoUserClickAnswerList.add(index);
          }
          setState(() {
          });
        }else{
          clickLabel = answer_str;
          _isSelected = true;
          if (clickLabel == question.answers[question.answer]) {
            _isCorrect = true;
            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: true);
          } else {
            _isCorrect = false;
            Provider.of<QuestionProvider>(context,listen: false).getCurrentSource(selectTrue: false);
          }
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].isSelect = _isSelected;
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].iscorrect = _isCorrect;
          Provider.of<QuestionProvider>(context,listen: false).getQuestionList[Provider.of<QuestionProvider>(context,listen: false).current].clickLabel = clickLabel;

          setState(() {});
          //如果答对，延时1S跳到下一问题
          if (clickLabel == question.answers[question.answer]) {
            Future.delayed(Duration(milliseconds: 1000), () {
              if( widget.selfControll != null && Provider.of<QuestionProvider>(context,listen: false).current != Provider.of<QuestionProvider>(context,listen: false).getQuestionList.length - 1){
                widget.selfControll.next();
              }
            });
          }
        }
      },
      child: _unClickWidget(answer_str,index),
    ) : _unClickWidget(answer_str,index);
  }

  Widget _unClickWidget(String answer_str,int index) {
    Widget _labelWidget;
    Widget _noSelectWidget = Card(
      shape: CircleBorder(),
      elevation: 5.0,
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdaper.width(40),
        height: ScreenAdaper.width(40),
        child:Text(['A','B','C','D','E','F','G'][index],
          style: TextStyle(fontSize: ScreenAdaper.sp(29), fontWeight: FontWeight.w300),),
      ),
    );

    if (!_isSelected) { //未选择
      //未选择时的标签A,B,C,D
      _labelWidget = _noSelectWidget;
    } else {
      if (_isCorrect) { //选择了正确的标签
        _labelWidget = Container(
          margin: EdgeInsets.only(left: ScreenAdaper.width(5)),
          child: Image.asset("asset/images/home/practice_success.png",width: ScreenAdaper.width(_imageWith),height: ScreenAdaper.width(_imageWith),),
        );
      } else { //选择了错误的标签
        _labelWidget = Container(
          margin: EdgeInsets.only(left: ScreenAdaper.width(5)),
          child: Image.asset("asset/images/home/practice_fill.png",width: ScreenAdaper.width(_imageWith),height: ScreenAdaper.width(_imageWith),),
        );
      }
    }

    Widget _duiWidget(){
      return Container(
        margin: EdgeInsets.only(left: ScreenAdaper.width(7),right: ScreenAdaper.width(7)),
        child: Image.asset("asset/images/home/practice_success.png",width: ScreenAdaper.width(_imageWith),height: ScreenAdaper.width(_imageWith),),
      );
    }
    Widget _cuoWidget(){
      return Container(
        margin: EdgeInsets.only(left: ScreenAdaper.width(7),right: ScreenAdaper.width(7)),
        child: Image.asset("asset/images/home/practice_fill.png",width: ScreenAdaper.width(_imageWith),height: ScreenAdaper.width(_imageWith),),
      );
    }

    return Container(
      margin: EdgeInsets.fromLTRB(
          width_10dp, height_10dp, width_10dp, height_10dp),
      child: Row(
        children: <Widget>[
//          _isSelected ? _isCorrect ?
//          ('answer.label' == clickLabel ? _labelWidget : _noSelectWidget) :
//          ('answer.label' == clickLabel ||
//             'answer.label' == 'question.answer.label' ? answer_str == clickLabel ? _labelWidget : Container(
//            margin: EdgeInsets.only(left: width_2dp),
//            child: Image.asset('asset/images/home/practice_success.png',width: ScreenAdaper.width(34),height: ScreenAdaper.width(34),),
//          ) : _noSelectWidget) :
//          _noSelectWidget,
          question.type == 1 ?Container(
            child:new Checkbox(
                value: question.duoUserClickAnswerList.contains(index)?true:false,
                activeColor: Colors.orange,
//                onChanged: (bool val) {
//                  // val 是布尔值
////                    setState(() {
////                      _isYizhu = !_isYizhu;
////                    });
////                  _examineCountGoalProvider.changeSelectList(index, val);
//                }
                )
          ):Container(),
          question.type ==1?_noSelectWidget:_isSelected ? (_isCorrect ?(answer_str == question.clickLabel?_duiWidget():_noSelectWidget):(question.answers[question.answer] == answer_str?_duiWidget():(answer_str==question.clickLabel?_cuoWidget():_noSelectWidget))) : _noSelectWidget,
          SizedBox(width: width_10dp,),
          Expanded(child: Container(
            child: Text(answer_str,
              style: TextStyle(fontSize: ScreenAdaper.sp(29), fontWeight: FontWeight.w300),),
          )),
        ],
      ),
    );
  }
}