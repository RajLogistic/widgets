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
    return Scaffold(
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
    );
  }
}
