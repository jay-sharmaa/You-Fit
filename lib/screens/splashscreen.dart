import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youfit/bottomnavpages/training_screen.dart';
import 'package:youfit/providers/user_provider.dart';
import 'package:youfit/screens/home_screen.dart';
import 'package:youfit/services/services.dart';
import '../preferencespage/page1.dart';
import '../preferencespage/page2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authservices = services();

  @override
  void initState() {
    wheretogo();
    super.initState();
  }

  final List<Widget> pages = [const Page1(), const Page2()];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;
    final conttroller = PageController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [LiquidSwipe(pages: pages)],
      ),
    );
  }

  void wheretogo() async {
    var prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.getBool("login/splash");
    // if (isloggedin!) {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       (MaterialPageRoute(builder: (context) {
    //         return HomeScreen();
    //       })),
    //       (route) => false);
    // }
    // else {}
  }
}
