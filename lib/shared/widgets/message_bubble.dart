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
          decoration: BoxDecoration(
            color: isMe ? AppColors.primaryColor : Colors.grey,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
          ),
          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(message.content,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 5),
              Text(
                timeago.format(message.sentTime),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
}
