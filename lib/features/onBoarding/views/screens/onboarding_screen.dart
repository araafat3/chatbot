import 'package:chatbot/core/utils/constants/app_font_size.dart';
import 'package:chatbot/features/onBoarding/view_model/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with OnboardigViewModel{

  Widget _buildImage(String assetName) {
    return Lottie.asset(
      assetName,
      height: 80.h
    );
  }

  @override
  Widget build(BuildContext context) {

    const pageDecoration = PageDecoration(
      imageFlex: 3,
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          allowImplicitScrolling: true,
          bodyPadding: EdgeInsets.only(top: 1.h),
          // autoScrollDuration: 3000,
          pages: onboardingList.map((item){
            return PageViewModel(
              body: "",
              titleWidget: Column(
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        fontSize: AppFontSize.large,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //for adding some space
                  SizedBox(height:2.h),

                  //subtitle
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      item.subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppFontSize.x_medium,
                          letterSpacing: .5,
                        ),
                    ),
                  ),
                ],
              ),
              image: _buildImage(item.image),
              decoration: pageDecoration,
            );
          }).toList(),
          onDone: () => onIntroEnd(),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(Icons.arrow_back,color: Colors.white,),
          skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,)),
          next: const Icon(Icons.arrow_forward,color: Colors.white,),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding:const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeColor: Colors.white,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: ShapeDecoration(
            color: Theme.of(context).dividerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
