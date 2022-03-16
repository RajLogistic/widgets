import 'package:flutter/material.dart';

class eight extends StatefulWidget {
  const eight({Key? key}) : super(key: key);

  @override
  State<eight> createState() => _eightState();
}

class _eightState extends State<eight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('pageview'),
      ),
      body: PageView(
        controller: PageController(),
        children: [
          Center(child: Text('First',style: TextStyle(fontSize: 30),)),
          Center(child: Text('Second',style: TextStyle(fontSize: 30))),
          Center(child: Text('Third',style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
