import 'package:flutter/material.dart';

import 'DetailsPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Activity #4',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const DetailsPage(),
  ));
}