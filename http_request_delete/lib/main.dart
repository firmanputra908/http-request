import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data = "belum ada data";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DELETE"),
        actions: [
          IconButton(onPressed: () async {
            var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
            Map<String,dynamic> mybody = jsonDecode(response.body);
            setState(() {
              data = "Name : ${mybody['data']['first_name']} ${mybody['data']['last_name']}"; 
            });
          }, 
          icon: Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: () async {
            var response = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
            if (response.statusCode == 204) {
              setState(() {
                data = "berhasil menghapus data";
              });
            }
          }, child: Text("DELETE"))
        ],
      ),
    );
  }
}