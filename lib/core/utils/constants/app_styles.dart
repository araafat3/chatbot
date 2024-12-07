import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_size.dart';
import 'package:sizer/sizer.dart';

abstract class AppStyles {

  static ButtonStyle buttonStyle =  ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFD3145A),
    // foregroundColor: AppColors.primary_color, // set it same color of button to remove splash
    // disabledBackgroundColor: AppColors.DISABLE_BUTTON_COLOR,  // when function null
    // disabledForegroundColor: AppColors.DISABLE_BUTTON_COLOR,
    // disabledMouseCursor: SystemMouseCursors.forbidden,
    padding: EdgeInsets.symmetric(vertical: 1.h),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(17)),
    ),
  );

  static ButtonStyle buttonStyle2 =  ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    padding: EdgeInsets.symmetric(vertical: 1.h),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(17)),
    ),
  );

  static ButtonStyle buttonStyle3 =  ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: Color(0xff0042B0), width: 2),
    ),
  );

  static ButtonStyle sessionButtonStyle =  ElevatedButton.styleFrom(
    backgroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(vertical: 15),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft:Radius.circular(10) ,
          bottomRight: Radius.circular(10),
      ),
    ),
  );

  static ButtonStyle sessionButtonDisableStyle =  ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15),
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft:Radius.circular(10) ,
          bottomRight: Radius.circular(10),
        ),
    ),
  );

  static UnderlineInputBorder underlineInputBorderBlack = UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.black),
  );

  static OutlineInputBorder outlineInputBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.0),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static OutlineInputBorder outlineInputBorderBlack =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(color: AppColors.black),
  );

  static TextStyle WHITE_STYLE_BOLD_30 = TextStyle(
      color: Colors.black,
      fontSize: AppFontSize.x_x_x_x_x_large,
      fontWeight: FontWeight.bold);

}
