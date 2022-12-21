import 'package:flutter/material.dart';
import 'package:activity4/form_entry.dart';
import 'package:activity4/item_display.dart';

import 'student_user.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late String returnedData = '';
  List person = [];
  List reference = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Activity #4'),
        leading: const Icon(Icons.home),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: person.length,
          itemBuilder: (context, index){
            return Dismissible(
              key: Key(person.toString()),
              direction: DismissDirection.endToStart,
              background: const Card(
                color:  Color(0xff807b7b),
                child:  Icon(Icons.delete),
              ),
              onDismissed: (direction) => setState(() {
                person.removeAt(index);
                reference.removeAt(index);
              }),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(person[index]['name']),
                subtitle: Text(person[index]['course']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayItem(item: person[index])
                      )
                  );
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          reference.add(await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyFormEntries())
          )
          );
          setState(() {
            person = reference.map((item) => {
              'id': item[0]['value_id'],
              'name': item[0]['value_name'],
              'birthday': item[0]['value_birthday'],
              'gender': item[0]['value_gender'],
              'section': item[0]['value_yearSection'],
              'course': item[0]['value_course'],
            }).toList();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
