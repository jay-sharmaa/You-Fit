import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youfit/bottomnavpages/records_screen.dart';
import 'package:youfit/bottomnavpages/profile.dart';
import 'package:youfit/bottomnavpages/training_screen.dart';
import 'package:youfit/mydrawerbasic.dart';
import 'package:youfit/providers/user_provider.dart';
import 'package:youfit/services/services.dart';
import '../Search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> list = const [
    trainingscreen(),
    settingscreen(),
    recordsscreen()
  ];

  @override
  void initState() {
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;
    final authservices = services();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youfit"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                authservices.signout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        height: 60,
        iconPadding: 12,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blueAccent,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.account_circle_sharp),
            label: 'Records',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.history),
            label: 'History',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      drawer: const mydrawer(),
      body: list[_selectedIndex],
    );
  }

  void set() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("login/splash", true);
  }
}
