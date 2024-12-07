import 'package:chatbot/core/application/listener/theme_listener.dart';
import 'package:chatbot/core/application/main_application.dart';
import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/helper/device_info_details.dart';
import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/utils/constants/theme.dart';
import 'package:chatbot/my_app_helper.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:chatbot/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    DeviceInfoDetails().initPlatformState().then((value) async {
      await Future.wait<dynamic>([
        LocalStorage().init(),
        ChatListener.initHive()
      ]);
    }),
  ]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiProvider(
      providers: MainApplication.applicationList,
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget with MyAppHelper{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<ThemeListener>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'ChatBot',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: value.themeMode,
              navigatorKey: AppNavigator().navigatorKey,
              onGenerateRoute: onGenerateRoute,
              initialRoute: firstScreen,
              );
            }
        );
      },
    );
  }
}
