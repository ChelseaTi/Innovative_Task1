import 'package:flutter/material.dart';

    class detailsPage extends StatefulWidget{

      final student;

      const detailsPage({required this.student, Key?: key}) : super ({key:key});

      @override
      Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: Text("Student Details"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                customText(text_title: "Name", text_data: student.name),
                customText(text_title: "Section", text_data: student.section),
                customText(text_title: "Age", text_data: student.age).toString()),
              ],
            ),
          )
        );
      }
}