import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youfit/screens/home_screen.dart';
import 'package:youfit/screens/splashscreen.dart';
import 'package:youfit/utils/utils.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../utils/Contants.dart';

class services {
  void signUpUser({required BuildContext context,
    required String email,
    required String password,
    required String name,
    required int height,
    required int weight
  }) async {
    try {
      User user =
      User(id: '',
          name: name,
          email: email,
          token: '',
          password: password,
          height: height,
          weight: weight
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Login with the same credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userprovider = Provider.of<userProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
          Uri.parse('${Constants.uri}/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            userprovider.setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SplashScreen(),
              ),
                  (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      var userprovide = Provider.of<userProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
          Uri.parse('${Constants.uri}/tokenisvalid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!,
          }
      );

      var response = jsonDecode(tokenRes.body);

      if(response == true){
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token,
            }
        );

        userprovide.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void signout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("x-auth-token", "");
    prefs.setBool("login/splash", false);
  }
}
