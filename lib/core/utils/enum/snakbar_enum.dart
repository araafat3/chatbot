import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';


enum SnakbarEnum {
  faild(
      AppColors.bgError,
      AppColors.iconError,
      Icons.error_outline_rounded
  ),
  success(
      AppColors.bgSuccess,
      AppColors.iconSuccess,
      Icons.check_circle_outline_sharp
  );

  const SnakbarEnum(
      this.backgroundColor,
      this.iconColor,
      this.icon,
      );

  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
}