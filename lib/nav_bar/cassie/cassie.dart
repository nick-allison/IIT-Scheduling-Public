import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/cassie/cassie_UI/cassie_chat_message.dart';
import 'package:iitschedulingapp/nav_bar/cassie/cassie_UI/cassie_chat_screen.dart';

class CASSIE extends StatelessWidget {
  const CASSIE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Make gray more transparent
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            ChatMessage(text: 'hello world', isUser: true),
            ChatScreen()
        ],
      ),
    );
  }
}