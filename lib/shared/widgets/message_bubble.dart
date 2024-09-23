import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../model/message.dart';
import '../themes/colors.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMe,
    required this.message,
  });

  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) => Align(
        alignment: isMe ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: !isMe ? const Color(0xff333333) : const Color(0xff048067),
            borderRadius: isMe
                ? const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
          ),
          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(message.content,
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 5),

              Row(
mainAxisAlignment: isMe?MainAxisAlignment.start:MainAxisAlignment.end,
                children: [

                   Text(
                    timeago.format(message.sentTime),
                    style:   TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
