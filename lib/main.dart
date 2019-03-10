import 'package:flutter/material.dart';
import 'package:indian_heritage/home_page/home_page.dart';
import 'package:indian_heritage/model/heritage_site.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(
        sites: heritageSites,
      ),
    );
  }
}
