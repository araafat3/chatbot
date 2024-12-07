import 'package:chatbot/features/home/view_model/hom_view_model.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeViewModel {

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListener>(
      builder: (context, chatProvider, child) {
        return Scaffold(
            body: SafeArea(
              child: PageView(
                controller: chatProvider.pageController,
                children: screens,
                onPageChanged: (index) {
                  chatProvider.setCurrentIndex(newIndex: index);
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: chatProvider.currentIndex,
              elevation: 0,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: (index)=>onClickNavBottom(index,chatProvider),
              items: navBottomList.map<BottomNavigationBarItem>((item) {
                return BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                );
              },).toList()
            ));
      },
    );
  }
}
