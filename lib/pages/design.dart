

import 'package:flutter/material.dart';
import 'package:newskawika/pages/api_class.dart';
import 'package:newskawika/pages/model_class.dart';
import 'package:provider/provider.dart';

import 'categories.dart';





class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  APISection? _apiSection;

  void initState(){

    _apiSection = context.read<APISection>();
  }

  @override
  Widget build(BuildContext context) {
     context.read<APISection>().fetchData();
    return Consumer<APISection>(
          builder: (context, value, child) => value.data.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.data["articles"].length,
                  itemBuilder: (context, index) => Card(
                    child: MaterialButton(
                      onPressed: (){
                        print("HelloWorld");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeNotifierProvider.value(value:_apiSection,child: Category(valueindex: index,))));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(

                              color: Colors.black,
                              height: 100,
                              width: 180,
                              child: Image.network(value.data["articles"][index]["urlToImage"]),
                            ),
                            SizedBox(width: 10,),
                            Container(

                              height: 100,
                              width: 160,

                              child: Text(value.data["articles"][index]["title"],maxLines: 5,style: TextStyle(fontWeight: FontWeight.bold),),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
    );

  }
}
