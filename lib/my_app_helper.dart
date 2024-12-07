import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/utils/constants/app_routes.dart';
import 'package:chatbot/core/utils/constants/storage_keys.dart';
import 'package:chatbot/features/chat_room/views/screens/chat_room_screen.dart';
import 'package:chatbot/features/home/screens/home_screen.dart';
import 'package:chatbot/features/onBoarding/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

mixin MyAppHelper{

  String get firstScreen{
    String routeName='';
    bool firstTimeOpen=LocalStorage().getFromBox(key: StorageKeys.firstTimeOpen)??true;
    if(firstTimeOpen){
      routeName=AppRoutes.onboardingRoute;
    }else{
      routeName=AppRoutes.homeRoute;
    }
    return routeName;
  }


  Route onGenerateRoute(RouteSettings routeSettings) {
    AppNavigator().routeSettings=routeSettings;
    switch (routeSettings.name) {

      case AppRoutes.chatRoute:
        return MaterialPageRoute(builder: (_) => const ChatRoomScreen());

      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return MaterialPageRoute(builder: (_) =>  Scaffold(
          body: Center(
            child: Text(
              "No Screen"
            ),
          ),
        ));
    }
  }
}