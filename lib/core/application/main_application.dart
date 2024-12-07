import 'package:chatbot/core/application/listener/theme_listener.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainApplication {
  static final List<SingleChildWidget> applicationList = [
    ChangeNotifierProvider<ThemeListener>(
        lazy:true,
        create: (context) => ThemeListener()),

    ChangeNotifierProvider(create: (context) => ChatListener()),
  ];
}