import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Model/users_data.dart';
import 'package:whatsapp/Widgets/Widgets.dart';

class ChatBox extends StatefulWidget {
  UserModel user;
  ChatBox({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  bool isMessageSelected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMessageSelected?appbar2():appbar1(context,widget.user.profile,widget.user.name),
      body: Stack(
        children:[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CachedNetworkImage(fit: BoxFit.fill,imageUrl: 'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png'),

      ), Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center ,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                   height: 55,
                   width: MediaQuery.of(context).size.width-60,
                   child: TextField(
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30),
                         borderSide: BorderSide.none,
                       ),
                     ),
                   ),
                 ),
                  FloatingActionButton(onPressed: (){},child: Icon(Icons.mic),)
                ],
              ),
            ),
          ),
      ],
      ),
    );
  }
}
