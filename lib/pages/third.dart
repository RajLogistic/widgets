import 'package:flutter/material.dart';

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
                PopupMenuItem(child: ListTile(
                  leading: Icon(Icons.messenger),
                  title: Text('messege'),
                ),
                ),
                PopupMenuItem(child: ListTile(
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
    );
  }
}
