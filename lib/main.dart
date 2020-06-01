import 'package:flutter/material.dart';
import 'package:photowall/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Home(),
    );
  }
}
