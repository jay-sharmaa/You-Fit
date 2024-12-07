import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{
  List<String> list = [
    "Arms",
    "Chest",
    "Legs",
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
    return null;
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