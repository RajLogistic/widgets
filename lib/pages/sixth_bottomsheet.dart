import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class sixth extends StatefulWidget {
  const sixth({Key? key}) : super(key: key);

  @override
  State<sixth> createState() => _sixthState();
}

class _sixthState extends State<sixth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottomsheet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        color: Colors.blueGrey[200],
                        child: Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Transform.rotate(angle: 180*math.pi/180);
                            },
                            icon: (Icon(Icons.keyboard_arrow_up_sharp)),
                            iconSize: 40,
                          ),

                        ]),
                      );
                    });
              },
              child: Text('Show bottomsheet'),
            ),
          ),
        ],
      ),
    );
  }
}
