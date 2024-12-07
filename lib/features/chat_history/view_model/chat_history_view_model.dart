import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/utils/constants/app_routes.dart';
import 'package:chatbot/core/utils/constants/storage_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

mixin ChatHistoryViewModel{
  late BuildContext showCaseBuildContext;
  final GlobalKey add = GlobalKey();

  onInit(){
    bool firstTimeShowHome=LocalStorage().getFromBox(key: StorageKeys.firstTimeShowHome)??true;
    if (firstTimeShowHome) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ShowCaseWidget.of(showCaseBuildContext).startShowCase([add]);
      });
      LocalStorage().putInBox(key: StorageKeys.firstTimeShowHome,value: false);

    }
  }

  openNewChat()async {
    // navigate to chat screen
    // navigate to chat screen
    final chatProvider = AppNavigator().currentContext().read<ChatListener>();
    // prepare chat room
    await chatProvider.prepareChatRoom(
      isNewChat: true,
      chatID: '',
    );
    AppNavigator().push(routeName: AppRoutes.chatRoute);
    // chatProvider.setCurrentIndex(newIndex: 1);
    // chatProvider.pageController.jumpToPage(1);
  }

}