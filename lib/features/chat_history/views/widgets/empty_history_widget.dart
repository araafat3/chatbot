import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/core/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No chat found, start a new chat!',
          ),
        ),
      ),
    );
  }
}
