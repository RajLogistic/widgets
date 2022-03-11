import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';

class MyList extends StatelessWidget {
  final Model item;

  MyList({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Card(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 7,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),

        child: Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    child: Container(
                      width: 130,
                      height: 220,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' + item.poster_path,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        fit: BoxFit.fill,

                      ),
                    ),
                     // borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.kalam().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          item.release_date,
                          style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.changa().fontFamily, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          item.overview,
                          style: TextStyle(fontSize: 17, fontFamily: GoogleFonts.lato().fontFamily,letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
