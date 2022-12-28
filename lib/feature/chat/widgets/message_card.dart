import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/models/message_model.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.isSender,
    required this.haveNip,
    required this.message,
  }) : super(key: key);

  final bool isSender;
  final bool haveNip;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: isSender
            ? 80
            : haveNip
                ? 10
                : 15,
        right: isSender
            ? haveNip
                ? 10
                : 15
            : 80,
      ),
      child: ClipPath(
        clipper: haveNip
            ? UpperNipMessageClipperTwo(
                isSender ? MessageType.send : MessageType.receive,
                nipWidth: 8,
                nipHeight: 10,
                bubbleRadius: haveNip ? 12 : 0,
              )
            : null,
        child: Container(
          padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: isSender ? 10 : 15,
            right: isSender ? 15 : 10,
          ),
          decoration: BoxDecoration(
            color: isSender
                ? context.theme.senderChatCardBg
                : context.theme.receiverChatCardBg,
            borderRadius: haveNip ? null : BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black38),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "${message.textMessage}         ",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  DateFormat.Hm().format(message.timeSent),
                  style: TextStyle(
                    fontSize: 11,
                    color: context.theme.greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
