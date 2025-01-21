import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:push_chat/model/chat_model.dart';

class ChatUserCart extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ChatModel chatModel;
  const ChatUserCart({super.key, required this.chatModel});

  @override
  State<ChatUserCart> createState() => _ChatUserCartState();
}

class _ChatUserCartState extends State<ChatUserCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: 4),
      elevation: 1,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: ClipOval(
            child: CachedNetworkImage(
              height: 100,
              width: 60,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              imageUrl: widget.chatModel.image,
              errorWidget: (context, url, error) => CircleAvatar(
                child: Icon(Icons.error),
              ),
            ),
          ),

          title: Text(
            widget.chatModel.name,
            style: TextStyle(fontFamily: 'regular'),
          ),
          subtitle: Text(
            "Last used message",
            maxLines: 1,
            style: TextStyle(fontFamily: 'regular'),
          ),
          trailing: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green.shade400),
            ),
          ),
          // trailing: Text(
          //   "12:00 PM",
          //   style: TextStyle(color: Colors.black54, fontFamily: 'regular'),
          // ),
        ),
      ),
    );
  }
}
