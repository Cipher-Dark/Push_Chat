import 'package:flutter/material.dart';
import 'package:push_chat/screens/auth/google_sign_in.dart';
import 'package:push_chat/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimated = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Push Chat",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'bold',
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: size.height * .15,
            left: _isAnimated ? size.width * .25 : -size.width * .5,
            width: size.width * .5,
            duration: Duration(seconds: 1),
            child: Image.asset("assets/icon/icon.png"),
          ),
          Positioned(
            bottom: size.height * .20,
            left: size.width * .05,
            width: size.width * .9,
            height: size.height * .07,
            child: InkWell(
              onTap: () {
                signup(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blue[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 40,
                  children: [
                    Image.asset("assets/icon/google.png"),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Sign in with",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: " Google",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
