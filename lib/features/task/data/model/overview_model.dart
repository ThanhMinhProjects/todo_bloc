import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/gen/assets.gen.dart';

class OverviewModel {
  final String iconPath;
  final String text;
  final ScreenType screenType;

  OverviewModel(
      {required this.iconPath, required this.text, required this.screenType});
}

List<OverviewModel> overviews = [
  OverviewModel(
      iconPath: Assets.icons.svg.taskToday,
      text: 'Today',
      screenType: ScreenType.task),
  OverviewModel(
      iconPath: Assets.icons.svg.taskProcessing,
      text: 'Processing',
      screenType: ScreenType.task),
  OverviewModel(
      iconPath: Assets.icons.svg.taskCompleted,
      text: 'Done',
      screenType: ScreenType.task),
  OverviewModel(
      iconPath: Assets.icons.svg.taskFail,
      text: 'Fail',
      screenType: ScreenType.task)
];
