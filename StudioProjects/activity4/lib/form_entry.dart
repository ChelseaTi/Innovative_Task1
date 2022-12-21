import 'package:flutter/material.dart';


class MyFormEntries extends StatefulWidget {

  const MyFormEntries({Key? key}) : super(key: key);

  @override
  State<MyFormEntries> createState() => _MyFormEntriesState();
}

class _MyFormEntriesState extends State<MyFormEntries> {
  var birthdateController = TextEditingController();
  var nameController = TextEditingController();
  var idController = TextEditingController();
  String? gender;
  var yearSectionController = TextEditingController();
  var courseController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    birthdateController.dispose();
    gender="";
    yearSectionController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("Add Student"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: formKey,
        child: Card(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              TextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.numbers),
                    hintText: 'e.g 1020110',
                    labelText: 'Student ID No.'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputNumber){
                  return (inputNumber == '') ? "Can\'t \"be empty\"": null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'e.g Peter Sid',
                    labelText: 'Name'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputName){
                  return (inputName == '') ? "Can\'t \"be empty\"": null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: birthdateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'yyyy-mm-dd',
                    labelText: 'Birthdate'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputBirthdate){
                  return (inputBirthdate == '') ? "Can\'t \"be empty\"": null;
                },
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: 'Gender',
                ),
                onChanged: (value) => setState(() => gender = value!),
                validator: (value) {
                  return (value == null) ? "Can\'t \"be empty\"":  null;
                },
                items: const ['Male', 'Female'].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: yearSectionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.leaderboard),
                    hintText: 'e.g 3rd-year 3R1',
                    labelText: 'Year&Section'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputYearSection){
                  return (inputYearSection == '') ? "Can\'t \"be empty\"": null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: courseController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.golf_course),
                    hintText: 'e.g Bachelor of Science in Information Technology',
                    labelText: 'Course'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (inputCourse){
                  return (inputCourse == '') ? "Can\'t \"be empty\"": null;
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async{
                    var formValid = formKey.currentState!.validate();
                    if (formValid){

                      var student = <Map<String, dynamic>>[
                        {
                          'value_id': idController.text,
                          'value_name': nameController.text,
                          'value_birthdate': birthdateController.text,
                          'value_course': gender,
                          'value_yearSection': yearSectionController.text,
                          'value_gender': courseController.text,
                        }
                      ];
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Entry Saved!')));
                      Navigator.pop(context, student);
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
