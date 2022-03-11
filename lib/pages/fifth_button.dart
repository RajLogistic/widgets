import 'package:flutter/material.dart';

class fifth extends StatefulWidget {
  const fifth({Key? key}) : super(key: key);

  @override
  State<fifth> createState() => _fifthState();
}

class _fifthState extends State<fifth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fifth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             MaterialButton(
              onPressed: () {},
              child: Text(
                'MaterialButton',
                style: TextStyle(fontSize: 17),
              ),color: Colors.cyan,
            ),
            ElevatedButton(onPressed: (){}, child:Text('ElevatedButton'),style:ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith((states) => Colors.amber) ),
            ),
            RaisedButton(onPressed: (){},child: Text('RaisedButton'),splashColor: Colors.pink[200],color: Colors.brown),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.email), label: Text('FlatButton'),color: Colors.blueAccent,),
          ],
        ),
      ),
    );
  }
}
