import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:push_chat/api/apis.dart';
import 'package:push_chat/helper/dialogs.dart';
import 'package:push_chat/model/chat_model.dart';
import 'package:push_chat/screens/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final ChatModel user;
  ProfileScreen({
    super.key,
    required this.user,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontFamily: 'bold', fontSize: 25),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: size.height * .03,
                children: [
                  Stack(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          imageUrl: user.image,
                          errorWidget: (context, url, error) => CircleAvatar(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.white,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontFamily: 'regular', fontSize: 20),
                  ),
                  TextFormField(
                    onSaved: (newValue) => APIs.uData.name = newValue ?? "",
                    validator: (value) => value!.isNotEmpty && value != '' ? null : " Required Field",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                      hintText: "eg Sagar Bisht",
                      hintStyle: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      label: Text(
                        user.name,
                        style: TextStyle(fontFamily: 'regular', fontSize: 20),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) => APIs.uData.about = newValue ?? "",
                    validator: (value) => value!.isNotEmpty && value != ' ' ? null : " Required Field",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.info_outline,
                        color: Colors.deepPurple,
                      ),
                      hintText: "Hey! I'm using Push Chat",
                      hintStyle: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      label: Text(
                        user.about,
                        style: TextStyle(fontFamily: 'regular', fontSize: 20),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(size.width * .5, size.height * .05),
                      backgroundColor: Colors.blue,
                      iconColor: Colors.white,
                      textStyle: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 20,
                      ),
                      foregroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.edit),
                    label: Text("UPDATE"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        APIs.updateUserInfo().then((onValue) {
                          Dialogs.showSnackBar(context, "Profile Updated");
                        });
                        log("Update done");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
            label: Text("Logout"),
            onPressed: () async {
              Dialogs.showProgressBar(context);
              await APIs.auth.signOut().then((value) async {
                await GoogleSignIn().signOut().then((value) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
                });
              });
            },
            icon: Icon(Icons.logout_sharp),
            backgroundColor: Colors.orange.shade500,
          ),
        ),
      ),
    );
  }
}
