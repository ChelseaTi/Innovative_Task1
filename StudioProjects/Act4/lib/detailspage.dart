import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {

  List students = [
    {'name': 'Dan Walker', 'address': 'Cagayan de Oro City'},
    {'name': 'Paul Walker', 'address': 'Butuan City'},
    {'name': 'Johnnie Walker', 'address': 'Bukidnon City'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activity #4'),
        ),
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(students[index]['name']),
                subtitle: Text(students[index]['address']),
              );
            }
        )
    );
  }
}