import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:chatbot/features/home/model/nav_bottom_model.dart';
import 'package:chatbot/features/settings/views/screens/settings_screen.dart';
import 'package:chatbot/features/chat_history/views/screens/chat_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin HomeViewModel{

  final List<Widget> screens = [
    const ChatHistoryScreen(),
    const SettingsScreen(),
  ];

  final List<NavBottomModel> navBottomList=[
    NavBottomModel(
      icon: Icons.history,
      label: 'Chat History',
    ),
    NavBottomModel(
      icon: Icons.settings,
      label: 'Settings',
    ),
  ];

  onClickNavBottom(int index,ChatListener chatProvider) {
    chatProvider.setCurrentIndex(newIndex: index);
    chatProvider.pageController.jumpToPage(index);
  }

}