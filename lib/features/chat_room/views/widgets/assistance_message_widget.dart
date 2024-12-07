import 'package:chatbot/core/model/message_model.dart';
import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class AssistantMessageWidget extends StatelessWidget {
  const AssistantMessageWidget({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 8),
          child: message.message.isEmpty
              ? const SizedBox(
                  width: 50,
                  child: SpinKitThreeBounce(
                    color: Colors.blueGrey,
                    size: 20.0,
                  ),
                )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarkdownBody(
                      selectable: true,
                      data: message.message.toString(),
                    ),
                  SizedBox(height: 8,),
                  Text(
                    DateFormat('hh:mm a').format(message.timeSent),
                    style: TextStyle(fontWeight:FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ],
              )
      ),
    );
  }
}
