import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youfit/drawernavpages/drawerpage1.dart';
import 'package:youfit/drawernavpages/drawerpage2.dart';
import 'package:youfit/screens/home_screen.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(Icons.person,size: 60)
              ),
              decoration: BoxDecoration( color: Colors.blueAccent)
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Page 1"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Drawerpage1();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Page 2"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Drawerpage2();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
