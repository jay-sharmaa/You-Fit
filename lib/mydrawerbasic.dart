import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youfit/drawernavpages/Sensor_check.dart';
import 'package:youfit/drawernavpages/drawerpage1.dart';
import 'package:youfit/drawernavpages/drawerpage2.dart';
import 'package:youfit/screens/home_screen.dart';
import 'package:youfit/services/services.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  final authservices = services();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration( color: Colors.blueAccent),
                  child: Center(
                    child: Icon(Icons.person,size: 60)
                  )
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const HomeScreen();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Drawerpage1();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("Info"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Drawerpage2();
                    }));
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
              onTap: (){
                 authservices.signout();
              },
            )
          ],
        ),
      ),
    );
  }
}
