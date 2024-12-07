import 'dart:developer';

import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/model/chat_history.dart';
import 'package:chatbot/features/chat_history/view_model/chat_history_view_model.dart';
import 'package:chatbot/features/chat_history/views/widgets/chat_history_widget.dart';
import 'package:chatbot/features/chat_history/views/widgets/empty_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> with ChatHistoryViewModel {


  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        onStart: (index, key) {
          log('onStart: $index, $key');
        },
        blurValue: 1,
        autoPlayDelay: const Duration(seconds: 3),
        builder: (context){
          showCaseBuildContext = context;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              centerTitle: true,
              title: const Text('Chat history'),
            ),
            body: ValueListenableBuilder<Box<ChatHistory>>(
              valueListenable: LocalStorage().getChatHistory().listenable(),
              builder: (context, box, _) {
                final chatHistory = box.values.toList().cast<ChatHistory>().reversed.toList();
                return chatHistory.isEmpty
                    ? const EmptyHistoryWidget()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: chatHistory.length,
                          itemBuilder: (context, index) {
                            final chat = chatHistory[index];
                            return ChatHistoryWidget(chat: chat);
                          },
                        ),
                      );
              },
            ),
          floatingActionButton: Showcase(
            key: add,
            description: 'add new chat bot room',
            overlayOpacity: 0.5,
            targetShapeBorder: const CircleBorder(),
            child: FloatingActionButton(
              isExtended: true,
              shape: CircleBorder(),
              child: Icon(Icons.add),
              onPressed: openNewChat,
            ),
          ),
        );
      }
    );
  }
}
