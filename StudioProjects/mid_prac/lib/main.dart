import 'package:flutter/material.dart';
import 'package:mid_prac/homepage.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey
        ),
        ),
      home: HomePage()
  ));
}