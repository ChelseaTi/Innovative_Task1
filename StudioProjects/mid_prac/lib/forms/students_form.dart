import 'package:flutter/material.dart';
import 'package:mid_prac/mods/student.dart';

  class StudentsForm extends StatefulWidget {
    const StudentsForm ({Key? key}) : super (Key:Key);

    @override
    State<StudentsForm> createState() => _StudentsFormState();
}

  class _StudentsFormState extends State<StudentsForm> {

    var formKey = GlobalKey<formState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    var selectedSection;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text ("This is Student's Form")
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.symmetric (vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Chelsea Shaira E. Tibudan",
                      labelText: "Name"
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? "Please Input Your Name": null;
                    },
                  ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colors.purple
                          ),
                            borderRadius: BorderRadius.circular(4)
                          ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonFormField(
                            hint: const Text("Please Input Your Section"),
                            items: const [
                              DropdownMenuItem (
                                value: "R1",
                                child: Text ("R1"),
                              ),
                            ],
                          )
                        ),
                      ))
                ],
              )
            )
          ),
        )
      )
    }
  }