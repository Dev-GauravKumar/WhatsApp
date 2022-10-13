import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ViewModel/ViewModel.dart';
import 'package:whatsapp/Widgets/Widgets.dart';
class ChatsList extends StatefulWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    final chatList=Provider.of<UserData>(context).chats;
       return buildChatList(chatList,context);
  }
}
