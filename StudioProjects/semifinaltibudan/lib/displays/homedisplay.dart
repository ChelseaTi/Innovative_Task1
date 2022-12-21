import 'package:flutter/material.dart';
import 'package:semifinaltibudan/repos/todo_rep.dart';
import '../controllers/todo_controller.dart';
import '../mymodels/todo.dart';

class HomeDisplay extends StatelessWidget  {
  @override

  Widget build (BuildContext context){

    var todoController = TodoController (TodoRep());
    todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
          title: Text ('SEMIFINAL'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: TodoController.fetchTodoList(),
        builder: (context, index){
            return ListView.separated(
                itemBuilder: (context, snapshot){

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center (child: CircularProgressIndicator());
                  }
                    if (snapshot.hasError) {
                      return Center (child: Text('hala error :<'),
                      );
                    }
                  return Container ();
                }, separatorBuilder: (context, index) {
                  return Divider(thickness: 0.5, height: 0.5,);
            },
                itemCount: snapshot.data?.length ?? 0);
        },
      ),
    );
  }
}