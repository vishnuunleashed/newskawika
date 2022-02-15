import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          Container(child: Text("TechCrunch News",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          Container(child: Text("Created by Vishnuprasad",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

        ],),
      ),
    );
  }
}
