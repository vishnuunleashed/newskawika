import 'package:flutter/material.dart';
import 'package:newskawika/pages/api_class.dart';
import 'package:newskawika/pages/categories.dart';
import 'package:newskawika/pages/design.dart';
import 'package:newskawika/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         home: MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {


  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  void initState(){
    _selectedIndex = 0;
  }
   callData(index){
    setState(() {
      _selectedIndex = index;
    });

  }

  final screen = [
    Home(),
    ChangeNotifierProvider(
         create: (context)=>APISection(),builder: (BuildContext context,child)=>MyHomePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Main News"),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(children: [
                ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.home),
                ),
                ListTile(
                  title: Text('Categories'),
                  trailing: Icon(Icons.category),
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  trailing: Icon(Icons.close),
                ),
              ],),
            ),

            bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),

            ],
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              currentIndex: 0,
              onTap: callData,

            ),

        body: screen[_selectedIndex]);
  }
}
// ChangeNotifierProvider(
// create: (context)=>APISection(),builder: (BuildContext context,child)=>MyHomePage(),),);