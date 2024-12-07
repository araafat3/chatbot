import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/utils/constants/app_routes.dart';
import 'package:chatbot/core/widgets/custom_dialog.dart';
import 'package:chatbot/core/model/chat_history.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({
    super.key,
    required this.chat,
  });

  final ChatHistory chat;

  deleteChatHistory(){
    CustomDialog().showMyAnimatedDialog(
      title: 'Delete Chat',
      content: 'Are you sure you want to delete this chat?',
      actionText: 'Delete',
      onActionPressed: (value) async {
        if (value) {
          // delete the chat
          await AppNavigator().currentContext()
              .read<ChatListener>()
              .deletChatMessages(chatId: chat.chatId);

          // delete the chat history
          await chat.delete();
        }
      },
    );
  }

  goToChatRoom()async {
    // navigate to chat screen
    final chatProvider = AppNavigator().currentContext().read<ChatListener>();
    // prepare chat room
    await chatProvider.prepareChatRoom(
      isNewChat: false,
      chatID: chat.chatId,
    );
    AppNavigator().push(routeName: AppRoutes.chatRoute);
    // chatProvider.setCurrentIndex(newIndex: 1);
    // chatProvider.pageController.jumpToPage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        leading: const CircleAvatar(
          radius: 30,
          child: Icon(Icons.chat),
        ),
        title: Text(
          chat.prompt,
          maxLines: 1,
        ),
        subtitle: Text(
          chat.response,
          maxLines: 2,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: goToChatRoom,
        onLongPress: deleteChatHistory,
      ),
    );
  }
}
