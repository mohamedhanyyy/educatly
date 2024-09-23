import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/service/notifications/notification_service.dart';
import '../../service/firebase/firebase_firestore_service.dart';
import '../themes/colors.dart';
import 'custom_text_form_field.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.receiverId});

  final String receiverId;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final controller = TextEditingController();
  final notificationService=NotificationsService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.getReceiverToken(widget.receiverId);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: controller,
              hintText: 'Add Message...',
            ),
          ),
          const SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () => _sendText(context),
            ),
          ),
        ],
      );

  Future<void> _sendText(BuildContext context) async {
    if (controller.text.isNotEmpty) {
      await FirebaseFirestoreService.addTextMessage(
        receiverId: widget.receiverId,
        content: controller.text,
      );
      await notificationService.sendNotification(body: controller.text, senderId: FirebaseAuth.instance.currentUser!.uid);
      controller.clear();
      FocusScope.of(context).unfocus();
    }
    FocusScope.of(context).unfocus();
  }
}
