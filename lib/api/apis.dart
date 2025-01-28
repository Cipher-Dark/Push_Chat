import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:push_chat/model/chat_model.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static late ChatModel uData;

  // for accesssing the firebase database
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // get user
  static User get user => auth.currentUser!;

  // for checking user is exist or not
  static Future<bool> userExist() async {
    return (await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).get()).exists;
  }

  //for creating new user
  static Future<void> createUser() async {
    final time = DateTime.now().microsecondsSinceEpoch.toString();
    final chatUser = ChatModel(
      id: user.uid.toString(),
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "feeling good",
      image: user.photoURL.toString(),
      createdAt: time,
      lastActive: time,
      isOnline: false,
      pushToken: "",
    );
    return (await firebaseFirestore.collection('users').doc(user.uid).set(
          chatUser.toJson(),
        ));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUserData() {
    return firebaseFirestore.collection('users').where('id', isNotEqualTo: user.uid).snapshots();
  }

  //get current user data
  static Future<void> getCurrentUser() async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).get().then(
      (user) {
        if (user.exists) {
          uData = ChatModel.fromJson(user.data()!);
        } else {
          createUser().then(
            (value) => getCurrentUser(),
          );
        }
      },
    );
  }

  static Future<void> updateUserInfo() async {
    log(uData.name);
    await firebaseFirestore.collection("users").doc(user.uid).update({
      "name": uData.name,
      "about": uData.about,
    });
  }
}
