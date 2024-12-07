import 'dart:async';

import 'package:flutter/widgets.dart';

mixin ChatRoomViewModel{
  late final StreamController fabController;
  bool showFloatingBotton=false;
  final ScrollController scrollController = ScrollController();

  onInit(){
    fabController=StreamController();
    scrollController.addListener(listenScrolling);
  }

  onDispose(){
    fabController.close();
  }

  void listenScrolling() {
    if (scrollController.position.pixels==scrollController.position.maxScrollExtent
        && showFloatingBotton==true) {
      showFloatingBotton=false;
      fabController.sink.add(false);
    } else {
      showFloatingBotton=true;
      fabController.sink.add(true);
    }
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double end = scrollController.position.maxScrollExtent;
      scrollController.jumpTo(end);
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients &&
          scrollController.position.maxScrollExtent > 0.0) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

}