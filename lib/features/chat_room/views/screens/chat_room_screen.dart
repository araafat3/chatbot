import 'package:chatbot/core/widgets/custom_dialog.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:chatbot/features/chat_room/view_model/chat_roon_view_model.dart';
import 'package:chatbot/features/chat_room/views/widgets/bottom_chat_field.dart';
import 'package:chatbot/features/chat_room/views/widgets/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> with ChatRoomViewModel {

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListener>(
      builder: (context, chatProvider, child) {
        if (chatProvider.inChatMessages.isNotEmpty) {
          scrollDown();
        }

        // auto scroll to bottom on new message
        chatProvider.addListener(() {
          if (chatProvider.inChatMessages.isNotEmpty) {
            scrollToBottom();
          }
        });

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            centerTitle: true,
            title: const Text('Chat Room'),
            // actions: [
            //   if (chatProvider.inChatMessages.isNotEmpty)
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: CircleAvatar(
            //         child: IconButton(
            //           icon: const Icon(Icons.add),
            //           onPressed: () async {
            //             // show my animated dialog to start new chat
            //             CustomDialog().showMyAnimatedDialog(
            //               title: 'Start New Chat',
            //               content: 'Are you sure you want to start a new chat?',
            //               actionText: 'Yes',
            //               onActionPressed: (value) async {
            //                 if (value) {
            //                   // prepare chat room
            //                   await chatProvider.prepareChatRoom(
            //                       isNewChat: true, chatID: '');
            //                 }
            //               },
            //             );
            //           },
            //         ),
            //       ),
            //     )
            // ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: chatProvider.inChatMessages.isEmpty
                        ? const Center(
                            child: Text('No messages yet'),
                          )
                        : ChatMessages(
                            scrollController: scrollController,
                            chatProvider: chatProvider,
                          ),
                  ),

                  // input field
                  BottomChatField(
                    chatProvider: chatProvider,
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: StreamBuilder(
              stream: fabController.stream,
              builder: (context, snapshot) {
                return Visibility(
                  visible: showFloatingBotton,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: FloatingActionButton(
                      isExtended: true,
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_downward),
                      onPressed: scrollDown,
                    ),
                  ),
                );
              }
          ),
        );
      },
    );
  }
}
