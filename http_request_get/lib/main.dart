import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

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
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP GET'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : $id",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email : $email",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Name : $name",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var myResponse = await myhttp
                    .get(Uri.parse("https://reqres.in/api/users/2"));
                if (myResponse.statusCode == 200) {
                  print("berhasil get data");
                  Map<String, dynamic> data =
                      json.decode(myResponse.body) as Map<String, dynamic>;
                  print(data["data"]);
                  setState(() {
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });

                  myResponse.body;
                } else {
                  print('ERROR ${myResponse.statusCode}');
                }
              },
              child: Text("GET DATA"),
            )
          ],
        ),
      ),
    );
  }
}
