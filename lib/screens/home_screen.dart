import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:youfit/bottomnavpages/records_screen.dart';
import 'package:youfit/bottomnavpages/settings_screen.dart';
import 'package:youfit/bottomnavpages/training_screen.dart';
import 'package:youfit/mydrawerbasic.dart';
import 'package:youfit/providers/user_provider.dart';
import 'package:youfit/services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> list = [
    trainingscreen(),
    settingscreen(),
    recordsscreen()
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;
    final authservices = services();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youfit"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate());
          }, icon: Icon(Icons.search))
        ],
      ),
      bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          duration: const Duration(milliseconds: 200),
          backgroundColor: Colors.blueGrey,
          curve: Curves.linear,
          tabBorderRadius: 120,
          tabBackgroundColor: Colors.blue.shade200,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          gap: 8,
          tabs: const [
            GButton(
              icon: (Icons.watch_later_outlined),
              text: "Training",
            ),
            GButton(
              icon: (Icons.settings),
              text: "Settings",
            ),
            GButton(
              icon: (Icons.history),
              text: "Records",
            )
          ]),
      drawer: const mydrawer(),
      body: list[_selectedIndex],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> list = [
    "qweq",
    "qweqw",
    "qweqwe",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> mediaquery = [];
    for(var i in list){
      if(i.toLowerCase().contains(query)){
        mediaquery.add(i);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var result = mediaquery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> mediaquery = [];
    for(var i in list){
      if(i.toLowerCase().contains(query)){
        mediaquery.add(i);
      }
    }
    return ListView.builder(
      itemCount: mediaquery.length,
      itemBuilder: (context, index){
        var result = mediaquery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}