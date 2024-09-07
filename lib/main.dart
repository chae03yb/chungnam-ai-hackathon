import 'package:chungnam_ai_hackathon/graphscene.dart';
import 'package:chungnam_ai_hackathon/ranking.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: bar()
    );
  }
}

class bar extends StatefulWidget {
  const bar({super.key});

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {

  List<Widget> _selection = [
    graphPage(),
    rankingPage(),
  ];
  int _selected = 0;

  void _tapEvent(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _selection[_selected],
      ),
      bottomNavigationBar: Theme(
        data :ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Image.asset("assets/dd.png",width: 50,height: 50,),label: "Graph"),
              BottomNavigationBarItem(icon: Image.asset("assets/rankingImg.png",width: 50,height: 50,),label: "Ranking"),
            ],

            onTap: _tapEvent,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[650],
            currentIndex: _selected,
            type: BottomNavigationBarType.fixed
        ),
      )
    );
  }
}
