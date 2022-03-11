import 'package:flutter/material.dart';


class fourth extends StatefulWidget {
  const fourth({Key? key}) : super(key: key);

  @override
  State<fourth> createState() => _fourthState();
}

class _fourthState extends State<fourth> {

  final tabs=['Tab_1','Tab_2','Tab_3','Tab_4','Tab_5','Tab_6','Tab_7','Tab_8','Tab_9','Tab_10'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Tab'),
          bottom: TabBar(tabs: [
            for(final tab in tabs) Tab(text: tab,),
          ],isScrollable: true,indicatorColor: Colors.white,
          ),
          ),
        body: TabBarView(children: [
          for(final tab in tabs)
            Center(child: Text(tab),),

        ],),


      ),
    );
  }
}
