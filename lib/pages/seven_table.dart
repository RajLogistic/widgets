import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class seven extends StatefulWidget {
  const seven({Key? key}) : super(key: key);

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Table(
          defaultColumnWidth: FlexColumnWidth(200),
          border: TableBorder.all(color: Colors.black87, style: BorderStyle.solid, width: 2),
          children:[
            TableRow(children: [
              Column(children: [Text('Firstname', style: TextStyle(fontSize: 20.0))],),
              Column(children: [Text('Middlename', style: TextStyle(fontSize: 20.0))],),
              Column(children: [Text('Lastname', style: TextStyle(fontSize: 20.0))],),
            ]),
            TableRow(children: [
              Column(children: [Text('Firstname1')]),
              Column(children: [Text('Middlename1')]),
              Column(children: [Text('Lastname1')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Firstname2')],),
              Column(children: [Text('Middlename2')],),
              Column(children: [Text('Lastname2')],),
            ]),
            TableRow(children: [
              Column(children: [Text('Firstname3')],),
              Column(children: [Text('Middlename3')],),
              Column(children: [Text('Lastname3')],),
            ]),
          ],
        ),
      ),
    );
  }
}
