import 'package:flutter/material.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';

class DrawerItemModel {
  final String text;
  final IconData icon;
  final ScreenType screenType;

  DrawerItemModel(
      {required this.text, required this.icon, required this.screenType});
}

List<DrawerItemModel> drawerItems = [
  DrawerItemModel(
    text: 'Dashboard',
    icon: Icons.dashboard,
    screenType: ScreenType.dashboard,
  ),
  DrawerItemModel(
    text: 'Tasks',
    icon: Icons.task,
    screenType: ScreenType.task,
  ),
  DrawerItemModel(
    text: 'Projects',
    icon: Icons.folder,
    screenType: ScreenType.projects,
  ),
  DrawerItemModel(
    text: 'Calendar',
    icon: Icons.calendar_today,
    screenType: ScreenType.calendar,
  ),
  DrawerItemModel(
    text: 'Team/Users',
    icon: Icons.group,
    screenType: ScreenType.team,
  ),
  DrawerItemModel(
    text: 'Notifications',
    icon: Icons.notifications,
    screenType: ScreenType.notifications,
  ),
  DrawerItemModel(
    text: 'Reports',
    icon: Icons.bar_chart,
    screenType: ScreenType.reports,
  ),
  DrawerItemModel(
    text: 'Settings',
    icon: Icons.settings,
    screenType: ScreenType.settings,
  ),
  DrawerItemModel(
    text: 'Help/Support',
    icon: Icons.help,
    screenType: ScreenType.help,
  ),
];
