import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
              onPressed: () => CustomAlert(context),
              child: Text(
                'MaterialButton',
                style: TextStyle(fontSize: 17),
              ),
              color: Colors.cyan,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('ElevatedButton'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.amber)),
            ),
            RaisedButton(onPressed: () {}, child: Text('RaisedButton'), splashColor: Colors.pink[200], color: Colors.brown),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.email),
              label: Text('FlatButton'),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  CustomAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Popup Dialog Title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Custom Popup dialog Description."),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                    ),
                    Container(
                      height: 50,
                      child: InkWell(
                        highlightColor: Colors.grey[200],
                        onTap: () {},
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Container(
                      height: 50,
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        highlightColor: Colors.grey[200],
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
