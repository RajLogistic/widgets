import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  final List<Map> data = List.generate(20, (index) => {'id': index, 'name': 'Item$index', 'isSelected': false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Second'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigoAccent),
                child: Text(
                  'DRAWER',
                  style: TextStyle(fontFamily: GoogleFonts.lato().fontFamily, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
                title: Text('Tmdb',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/first');
                },

              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
                title: Text('BottomNavigation',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/third');
                },

              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
                title: Text('Scrollabe_Tab',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/fourth');
                },

              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
                title: Text('Button',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/fifth');
                },

              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
                title: Text('Bottomsheet',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/sixth');
                },

              ),
            ],
          ),
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: data[index]['isSelected'] == true ? Colors.blue[100] : Colors.white,elevation: 2,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            data[index]['isSelected'] = !data[index]['isSelected'];
                          });
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(data[index]['id'].toString()),
                        ),
                        title: Text(data[index]['name']),
                      ),
                    )
            )
        ),

      ),
    );
  }

  showExitPopup(context) {
    return  showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[100],
            content: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to exit?"),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                             exit(0);
                          },
                          child: Text("Yes"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('no selected');
                              Navigator.of(context).pop();
                            },
                            child: Text("No", style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}
