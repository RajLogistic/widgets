import 'package:flutter/material.dart';

class thirteen extends StatefulWidget {
  const thirteen({Key? key}) : super(key: key);

  @override
  State<thirteen> createState() => _thirteenState();
}

class _thirteenState extends State<thirteen> {
  final bool _running = true;

  Stream<String> _clock() async*{
    while(_running){
      await Future<void>.delayed(const Duration(seconds: 1));
      DateTime _now = DateTime.now();
      yield"${_now.hour}:${_now.minute}:${_now.second}:${_now.microsecond}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
      ),
      body: Center(
      child: StreamBuilder(stream:_clock(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        return Text(
          snapshot.data!,
          style: const TextStyle(fontSize: 50, color: Colors.blue),
        );


      },
      ),





      ),


    );
  }
}
