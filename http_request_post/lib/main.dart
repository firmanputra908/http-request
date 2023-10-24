import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HTTP POST",
        ),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Email"
            ),
          )
        ],
      ),
    );
  }
}