import 'package:chatbot/core/model/message_model.dart';
import 'package:chatbot/core/utils/constants/app_colors.dart';
import 'package:chatbot/features/chat_room/views/widgets/preview_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.imagesUrls.isNotEmpty)
                PreviewImagesWidget(
                  message: message,
                ),
              Padding(
                padding: message.imagesUrls.isNotEmpty?const EdgeInsets.fromLTRB(
                  4.0,
                  8.0,
                  4.0,
                  0.0,
                ): EdgeInsets.zero,
                child: MarkdownBody(
                  selectable: true,
                  data: message.message.toString(),
                ),
              ),
              SizedBox(height: 8,),
              Text(
                DateFormat('hh:mm a').format(message.timeSent),
                style: TextStyle(fontWeight:FontWeight.bold),
                textAlign: TextAlign.end,
              ),
            ],
          )),
    );
  }
}
