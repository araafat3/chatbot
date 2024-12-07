import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/utils/constants/app_routes.dart';
import 'package:chatbot/core/utils/constants/image_paths.dart';
import 'package:chatbot/core/utils/constants/storage_keys.dart';
import 'package:chatbot/features/onBoarding/model/onboarding_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

mixin OnboardigViewModel{
  final introKey = GlobalKey<IntroductionScreenState>();

  List<OnboardingEntity> onboardingList=[
    OnboardingEntity(
      image: ImagePaths.ONBOARDING_IM_1,
      title: 'Ask me Anything',
      subTitle: 'I can be your Best Friend & You can ask me anything & I will help you!',
    ),
    OnboardingEntity(
      image: ImagePaths.ONBOARDING_IM_2,
      title: 'Imagination to Reality',
      subTitle: 'Just Imagine anything & let me know, I will create something wonderful for you!',
    ),
  ];

  void onIntroEnd() {
    LocalStorage().putInBox(key: StorageKeys.firstTimeOpen,value: false);
    AppNavigator().push(
        routeName: AppRoutes.homeRoute
    );
  }

}