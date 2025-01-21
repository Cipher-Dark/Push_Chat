import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:push_chat/api/apis.dart';
import 'package:push_chat/helper/dialogs.dart';
import 'package:push_chat/screens/home/home_screen.dart';

Future<void> signUp(BuildContext context) async {
  try {
    await InternetAddress.lookup('google.com');
    // ignore: use_build_context_synchronously
    Dialogs.showProgressBar(context);
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await APIs.auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (await APIs.userExist()) {
        log("User already exist");
        if (context.mounted) {
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      } else {
        log("New user");

        await APIs.createUser().then(
          (value) {
            if (context.mounted) {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          },
        );
      }
      log(user!.displayName ?? "Name");
    }
  } catch (e) {
    if (context.mounted) {
      Dialogs.showSnackBar(context, "Check your internet!");
    }
    log(e.toString());
  }
}
