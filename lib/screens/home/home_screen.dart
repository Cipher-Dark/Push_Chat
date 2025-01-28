import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_chat/api/apis.dart';
import 'package:push_chat/model/chat_model.dart';
import 'package:push_chat/screens/profile/profile_screen.dart';
import 'package:push_chat/widgets/chat_user_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    APIs.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: Text(
          "Push Chat",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'regular',
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen(user: APIs.uData)));
              },
              icon: Icon(Icons.more_vert)),
        ],
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: APIs.getAllUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No Users Found"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            itemCount: snapshot.data!.docs.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var user = snapshot.data;
              return ChatUserCart(
                chatModel: ChatModel.fromJson(user!.docs[index].data()),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {},
          child: Icon(Icons.insert_comment_outlined),
        ),
      ),
    );
  }
}
