import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDialog {

  static CustomDialog? _singleton;

  factory CustomDialog() {
    _singleton = _singleton ?? CustomDialog._internal();
    return _singleton!;
  }

  CustomDialog._internal();

  showDialogWidget({
    bool isDismissible =false,
    required Widget widget,
  }){
    showDialog(
      context: AppNavigator().currentContext(),
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 7.w),
          // contentPadding: EdgeInsets.all(2.h),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(15)
              )
          ),
          children:[
            Container(
                padding: EdgeInsets.all(2.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)
                    )
                ),
                child: widget
            )
          ]
        );
      },
    );
  }

  void showMyAnimatedDialog({
    required String title,
    required String content,
    required String actionText,
    required Function(bool) onActionPressed,
  }) async {
    showGeneralDialog(
        context: AppNavigator().currentContext(),
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, seconderyAnimation) {
          return Container();
        },
        transitionBuilder: (context, animation, seconderyAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: AlertDialog(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  content,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        onActionPressed(false);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        onActionPressed(true);
                        Navigator.of(context).pop();
                      },
                      child: Text(actionText)),
                ],
              ),
            ),
          );
        });
  }

}