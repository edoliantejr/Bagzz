import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(margin: const EdgeInsets.all(12), child: drawerIcon),
        title: const Text(
          'bagzz',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Playfair',
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/avatar.png'),
              //radius: 30,
            ),
          )
        ],
      ),
    );
  }
}

final Widget drawerIcon = SvgPicture.asset(
  'assets/drawericon.svg',
  height: 14,
  width: 24,
);
