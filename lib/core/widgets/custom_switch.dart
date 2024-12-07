import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function(bool value) onChange;
  final bool isDammed;
  const CustomSwitch({
    required this.value,
    required this.onChange,
    this.isDammed = false,
    Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: widget.value,
      trackColor: const WidgetStatePropertyAll<Color>(AppColors.iconSuccess),
      thumbColor: const WidgetStatePropertyAll<Color>(AppColors.black),
      onChanged: widget.isDammed?null:(bool value) {
        setState(() {
          widget.onChange(!widget.value);
        });
      },
    );
  }
}