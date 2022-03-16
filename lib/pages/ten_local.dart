import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ten extends StatelessWidget {
  const ten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Text(
            AppLocalizations.of(context)!.text,
            style: TextStyle(fontSize: 30),
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 30),
          )
        ]),
      ),
    );

}


