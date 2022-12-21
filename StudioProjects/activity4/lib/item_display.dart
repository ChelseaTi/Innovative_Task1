import 'package:flutter/material.dart';

  class DisplayItem extends StatelessWidget {
  final Map item;

  const DisplayItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
          title: const Text('Student\'s Details'),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.home),
          )
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.2),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              textDirection: TextDirection.rtl,
              children: [
                TableRow(
                    children: [
                      Text((item['id']), textScaleFactor: 1.5),
                      const Text('Student ID No.:', textScaleFactor: 1.5),
                    ]
                ),
                TableRow(
                    children: [
                      Text((item['name']), textScaleFactor: 1.5),
                      const Text('Student Name:', textScaleFactor: 1.5),
                    ]
                ),
                TableRow(
                    children: [
                      Text((item['birthdate']), textScaleFactor: 1.5),
                      const Text('Student Birthdate:', textScaleFactor: 1.5),
                    ]
                ),
                TableRow(
                    children: [
                      Text((item['gender']), textScaleFactor: 1.5),
                      const Text('Student Gender:', textScaleFactor: 1.5),
                    ]
                ),
                TableRow(
                    children: [
                      Text((item['yearSection']), textScaleFactor: 1.5),
                      const Text('Student Year&Section:', textScaleFactor: 1.5),
                    ]
                ),
                TableRow(
                    children: [
                      Text((item['course']), textScaleFactor: 1.5),
                      const Text('Student Course:', textScaleFactor: 1.5),
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*          Text('Student ID No.:                   ${item['id']}'),
            Text('Student Name:                     ${item['name']}'),
            Text('Student Birthday:               ${item['birthdate']}'),
            Text('Student Gender:                 ${item['gender']}'),
            Text('Student Year&Section:       ${item['yearSection']}'),
            Text('Student Course:                   ${item['course']}'),*/