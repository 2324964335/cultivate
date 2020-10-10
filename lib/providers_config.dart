import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/AppHomePage/Home/provider/counterStore.p.dart';
import 'pages/AppHomePage/Home/provider/ExamineCountGoalProvider.dart';
import 'pages/AppHomePage/provider/appHomePageStore.p.dart';
import 'provider/themeStore.p.dart';
import 'pages/AppHomePage/Examine/QuestionProvider.dart';
import 'pages/AppHomePage/Examine/AnswerQuestionBottomTool.dart';
import 'pages/AppHomePage/Examine/QuestionSliverControllProvider.dart';
List<SingleChildWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<AppHomePageStore>.value(value: AppHomePageStore()),
  ChangeNotifierProvider<CounterStore>.value(value: CounterStore()),
  ChangeNotifierProvider<ExamineCountGoalProvider>.value(value: ExamineCountGoalProvider()), ///考试的扣分项
  ChangeNotifierProvider<QuestionProvider>.value(value: QuestionProvider()), ///QuestionProvider 题库
  ChangeNotifierProvider<SliverDrawBottomControll>.value(value: SliverDrawBottomControll()), ///QuestionProvider 题库底部
  ChangeNotifierProvider<QuestionSliverControllProvider>.value(value: QuestionSliverControllProvider()), ///QuestionProvider 题库前进后退

];
