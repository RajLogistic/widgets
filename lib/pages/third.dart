import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.add_call),
                        title: Text('add call'),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.messenger),
                        title: Text('messege'),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.android),
                        title: Text('android'),
                      ),
                    ),
                    PopupMenuDivider(height: 60),
                    PopupMenuItem(child: Text('Item A')),
                    PopupMenuItem(child: Text('Item B')),
                  ])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        backgroundColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_sharp), label: ('Camera')),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ('Profile')),
        ],
        onTap: (int index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text(
                      'Name',
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple), borderRadius: BorderRadius.all(Radius.circular(30)))),
                cursorHeight: 25,
                style: TextStyle(fontSize: 20),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
