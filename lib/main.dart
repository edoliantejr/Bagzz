import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [

          CircleAvatar(
            //child: AssetImage(),
          )
        ],
      ),
    );
  }
}

