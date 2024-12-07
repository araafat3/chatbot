import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:chatbot/core/utils/constants/app_font_size.dart';
import 'package:chatbot/core/utils/enum/snakbar_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSnakbar {
  static CustomSnakbar? _singleton;

  factory CustomSnakbar() {
    _singleton = _singleton ?? CustomSnakbar._internal();
    return _singleton!;
  }

  CustomSnakbar._internal();

  appSnackBar({
    required String text,
    required SnakbarEnum snakbarEnum,
    bool isInfinty = false,
    bool isFloating = true
  }) {
    final snackBar = SnackBar(
      margin: isFloating?EdgeInsets.only(bottom: 6.h, right: 5.w, left: 5.w):null,
      duration: Duration(seconds: isInfinty?3000:4),
      shape: isFloating?RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))):null,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            snakbarEnum.icon,
            color: snakbarEnum.iconColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: AppFontSize.small,
                  color:  AppColors.black,
                  fontWeight: FontWeight.w500),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
      backgroundColor: snakbarEnum.backgroundColor,
      behavior: isFloating?SnackBarBehavior.floating:null,
      elevation: 0,
      padding: EdgeInsets.all(isFloating?10:20),
      dismissDirection: DismissDirection.none,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(AppNavigator().currentContext())
          .showSnackBar(snackBar);
    });
  }

  hideSnackbar() {
    ScaffoldMessenger.of(AppNavigator().currentContext()).removeCurrentSnackBar();
  }
}
