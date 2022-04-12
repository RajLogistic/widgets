import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class twelve extends StatefulWidget {
  const twelve({Key? key}) : super(key: key);

  @override
  State<twelve> createState() => _twelveState();
}

class _twelveState extends State<twelve> {
  final formGlobalKey = GlobalKey<FormState>();
  SharedPreferences? prefs;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  String? name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared preferences'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset('assets/aa.jpg'),
            Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is empty";
                        } else {
                          null;
                        }
                      },
                      controller: controller1,
                      decoration: InputDecoration(
                          label: Text(
                            'Name',
                            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple), borderRadius: BorderRadius.all(Radius.circular(10)))),
                      cursorHeight: 25,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 30, 35, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is empty";
                        } else {
                          null;
                        }
                      },
                      controller: controller2,
                      decoration: InputDecoration(
                          label: Text(
                            'password',
                            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple), borderRadius: BorderRadius.all(Radius.circular(10)))),
                      cursorHeight: 25,
                      style: TextStyle(fontSize: 20),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await save();
                    },
                    child: Text(
                      'Register',
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  save() async {
    if(formGlobalKey.currentState!.validate()){
    prefs = await SharedPreferences.getInstance();
    prefs!.setString("username", controller1.text.toString());
    prefs!.setString("password", controller2.text.toString());
    print(prefs?.getString('password'));
    print(prefs?.getString('username'));
    Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, '/login', arguments: {'prefs': prefs});
  }}

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs?.getString("username");
    setState(() {});
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.remove("username");
    name = "";
    setState(() {});
  }
}
