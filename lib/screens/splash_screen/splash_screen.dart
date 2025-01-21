import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push_chat/api/apis.dart';
import 'package:push_chat/screens/auth/login_screen.dart';
import 'package:push_chat/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      if (APIs.auth.currentUser != null) {
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        }
      } else if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.height * .15,
            left: size.width * .25,
            width: size.width * .5,
            child: Image.asset("assets/icon/icon.png"),
          ),
          Positioned(
            bottom: size.height * .20,
            left: size.width * .05,
            width: size.width * .9,
            height: size.height * .07,
            child: Center(
                child: Text(
              "Made in India with ❤️",
              style: TextStyle(
                fontFamily: 'regular',
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
