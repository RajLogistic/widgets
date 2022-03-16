
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tmdb_flutter/pages/eight_pageview.dart';
import 'package:tmdb_flutter/pages/eleven_sql.dart';
import 'package:tmdb_flutter/pages/fifth_button.dart';
import 'package:tmdb_flutter/pages/first.dart';
import 'package:tmdb_flutter/pages/fourth_tab.dart';
import 'package:tmdb_flutter/pages/nine_gesture.dart';
import 'package:tmdb_flutter/pages/second_list.dart';
import 'package:tmdb_flutter/pages/seven_table.dart';
import 'package:tmdb_flutter/pages/sixth_bottomsheet.dart';
import 'package:tmdb_flutter/pages/ten_local.dart';
import 'package:tmdb_flutter/pages/third.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: L10n.all,

    routes: {

      '/':(context)=>Splash(),
      '/second':(context)=>second(),
      '/first':(context)=>first(),
      '/third':(context)=>third(),
      '/fourth':(context)=>fourth(),
      '/fifth':(context)=>fifth(),
      '/sixth':(context)=>sixth(),
      '/seven':(context)=>seven(),
      '/eight':(context)=>eight(),
      '/nine':(context)=>nine(),
      '/ten':(context)=>ten(),
      '/eleven':(context)=>eleven(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


