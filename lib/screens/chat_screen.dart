import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/shared/constants.dart';
import '../../provider/firebase_provider.dart';
import '../shared/widgets/chat_messages.dart';
import '../shared/widgets/chat_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});

  final String userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false)
      ..getUserById(widget.userId)
      ..getMessages(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          ChatMessages(receiverId: widget.userId),
          ChatTextField(receiverId: widget.userId)
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      title: Consumer<FirebaseProvider>(
        builder: (context, value, child) => value.user != null
            ? Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(AppConstants.userImage),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.user!.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        value.user?.isOnline == true ? 'Online' : 'Offline',
                        style: TextStyle(
                          color:
                              value.user!.isOnline ? Colors.green : Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox(),
      ));
}
