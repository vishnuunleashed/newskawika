import 'package:flutter/material.dart';
import 'package:newskawika/pages/api_class.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  int? valueindex;

  Category({this.valueindex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub News"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
      ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),

      body: Consumer<APISection>(
        builder: (context, value, child) => value.data.length != 0
            ? ListView.builder(

                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => Card(
                  child: Padding(

                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Text(
                            value.data["articles"][valueindex]["title"],
                            style: TextStyle(decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Divider(),
                        Container(
                          color: Colors.black,
                          height: 260,
                          width: double.infinity,
                          child: Image.network(
                              value.data["articles"][valueindex]["urlToImage"]),
                        ),
                        Divider(),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Text(
                              value.data["articles"][valueindex]["content"],
                              style: TextStyle(
                               fontSize: 15)),
                        ),
                        Container(


                          height: 50,
                          width: double.infinity,
                          child: Text(
                            value.data["articles"][valueindex]["author"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            value.data["articles"][valueindex]["publishedAt"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
