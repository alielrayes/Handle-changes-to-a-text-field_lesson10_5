// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextApp(),
    );
  }
}

class TextApp extends StatefulWidget {
  const TextApp({Key? key}) : super(key: key);

  @override
  State<TextApp> createState() => _TextAppState();
}

class _TextAppState extends State<TextApp> {
  String myText = "";
  final myController = TextEditingController();

  myfunc() {
    setState(() {
      myText = myController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(myfunc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Handle changes to a text field",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(hintText: "What is ur name? "),
            ),
          ),
          SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {
              myfunc();
            },
            child: Text(
              "click here",
              style: TextStyle(fontSize: 19),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(13)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Text(
            "  My name is :  $myText ",
            style: TextStyle(fontSize: 27),
          )
        ],
      ),
    );
  }
}
