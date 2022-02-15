
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'model_class.dart';

class APISection extends ChangeNotifier{
  Map<String, dynamic> data = { };


  void fetchData() async{

    final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6eabe6c2e0ed4d1c83d9f9c077ec7eb6"));

    if(response.statusCode == 200){
      try {
        data = jsonDecode(response.body);
        notifyListeners();
        print(data["articles"][0]["urlToImage"]);
        print("Successful");

      }catch(e){
        print("Unsuccessful");

      }
    }
  }
}