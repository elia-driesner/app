import 'package:flutter/material.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Container(
            child:
                Card(child: Column(children: [Container(child: Text('test'))])),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0))
      ])),
    );
  }
}
