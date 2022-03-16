import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model.dart';
import '../my_list.dart';
import 'package:http/http.dart';
import 'dart:convert';


class first extends StatefulWidget {
  @override
  State<first> createState() => _rohanState();
}

class _rohanState extends State<first> {
  late final List<Model> modellist = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await this.getdata();
      setState(() { });
    });
    print('init');
  }
  @override
  Widget build(BuildContext context){
    print('hello');
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Tmdb'),
        centerTitle: true,
      ),

      body: GridView.builder(itemCount: modellist.length, itemBuilder: (context, index) => MyList(item : modellist[index]), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
    );
  }

  Future<void> getdata() async {
    await Future.delayed(Duration(seconds: 2));
    Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=b45cce70bce060e172f3dd4d7f839c55&language=en-US'));
    var data = jsonDecode(response.body);
    var responsearray = data['results'];
    for (int i = 0; i < responsearray.length; i++) {
      Map mapitem = responsearray[i];
      Model moviemodel = Model(mapitem['title'], mapitem['poster_path'], mapitem['release_date'], mapitem['overview']);
      modellist.add(moviemodel);
    }
  }
}