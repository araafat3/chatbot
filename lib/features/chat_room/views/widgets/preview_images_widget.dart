import 'dart:io';

import 'package:chatbot/core/model/message_model.dart';
import 'package:chatbot/core/application/listener/chat_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewImagesWidget extends StatelessWidget {
  const PreviewImagesWidget({
    super.key,
    this.message,
  });

  final MessageModel? message;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListener>(
      builder: (context, chatProvider, child) {
        final messageToShow =
            message != null ? message!.imagesUrls : chatProvider.imagesFileList;
        final padding = message != null
            ? EdgeInsets.zero
            : const EdgeInsets.only(left: 8.0, right: 8.0);
        return Padding(
          padding: padding,
          child: SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: messageToShow!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                        4.0,
                        8.0,
                        4.0,
                        0.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.file(
                          File(
                            message != null
                                ? message!.imagesUrls[index]
                                : chatProvider.imagesFileList![index].path,
                          ),
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  })),
        );
      },
    );
  }
}