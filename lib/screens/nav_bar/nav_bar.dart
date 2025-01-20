import 'package:flutter/material.dart';
import 'package:push_chat/screens/home/home_screen.dart';
import 'package:push_chat/screens/profile/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.transparent,
          height: 60,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.person_outline),
                text: "Profile",
              )
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}
