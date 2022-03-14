
import 'package:flutter/material.dart';
import 'package:tmdb_flutter/pages/fifth_button.dart';
import 'package:tmdb_flutter/pages/first.dart';
import 'package:tmdb_flutter/pages/fourth_tab.dart';
import 'package:tmdb_flutter/pages/second_list.dart';
import 'package:tmdb_flutter/pages/sixth_bottomsheet.dart';
import 'package:tmdb_flutter/pages/third.dart';



void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/':(context)=>second(),
      '/first':(context)=>first(),
      '/third':(context)=>third(),
      '/fourth':(context)=>fourth(),
      '/fifth':(context)=>fifth(),
      '/sixth':(context)=>sixth(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


