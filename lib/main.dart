import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youfit/providers/user_provider.dart';
import 'package:youfit/screens/home_screen.dart';
import 'package:youfit/screens/login_screen.dart';
import 'package:youfit/screens/signup_screen.dart';
import 'package:youfit/services/services.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => userProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final services authservices = services();
  @override
  void initState() {
    super.initState();
    authservices.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<userProvider>(context).user.token.isEmpty ? const HomeScreen() : const HomeScreen(),
    );
  }
}
