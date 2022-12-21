import 'package:flutter/material.dart';
import 'package:semifinaltibudan/displays/homedisplay.dart';

void main() {
  runApp( Application());
}

class Application extends StatelessWidget {
  const Application ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: Colors.indigo[100],
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
      ),
      home: HomeDisplay(),
    );
  }
}