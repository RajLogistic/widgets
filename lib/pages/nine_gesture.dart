import 'package:flutter/material.dart';


class nine extends StatefulWidget {
  const nine({Key? key}) : super(key: key);

  @override
  State<nine> createState() => _nineState();
}

class _nineState extends State<nine> {

  Color _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: _color,
          child: GestureDetector(
            onLongPress: (){
              setState(() {
                print('TAPED');
                _color ==Colors.yellow?_color=Colors.white:_color=Colors.yellow;
              });
            },
          ),
        ),
      ),
    );
  }
}
