import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tmdb_flutter/dbhander.dart';
import 'package:tmdb_flutter/sqlmodel/sql_model.dart';

class eleven extends StatefulWidget {
  @override
  State<eleven> createState() => _elevenState();
}

class _elevenState extends State<eleven> {
  late DatabaseHandler handler;
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      // await this.addUsers();
      setState(() {
      });
    });
  }
  void clearText() {
    myController.clear();
    myController2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DATABASE'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogwidget(context);
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: this.handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Info>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int>(snapshot.data![index].id!),
                  onDismissed: (DismissDirection direction) async {
                    await this.handler.deleteUser(snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].age.toString()),
                  )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<int> addUsers() async {
    Info firstUser = Info(name: myController.text, age: int.parse(myController2.text));
    List<Info> listOfUsers = [firstUser];
    return this.handler.insertUser(listOfUsers);
  }

  Future dialogwidget(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.grey[100],
            content: Container(
              height: 230,
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Add Info",style: TextStyle(fontSize: 20,fontFamily: GoogleFonts.hindGuntur().fontFamily),)),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          label: Text(
                            'Name',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                          label: Text(
                            'age',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                          contentPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 45,
                      ),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              addUsers();
                              Navigator.pop(context);
                              clearText();
                            });
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                          )),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            clearText();
                          },
                          child: Text('Cancel', style: TextStyle(fontSize: 18))),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
