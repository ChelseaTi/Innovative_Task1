import 'package:semifinaltibudan/mymodels/todo.dart';
import 'package:semifinaltibudan/repos/rep.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRep implements Rep {
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<String> deletedTodo(todo) {
    // TODO: implement deletedTodo
    throw UnimplementedError();
  }

  @override
  Future<List> getTodoList() async {
    List<Todo> todolist = [];
    var url = Uri.parse('$dataURL/todo');
    var response = await http.get(url);
    print('status code: ${response.statusCode}');
    var body = json.decode(response.body)

    // UwU parsemomintz
    for ( var meowts = 0; meowts < body.length; meowts++){
      todolist.add(TodoRep.fromJson(body[meowts]));
    }
    return todolist;
  }

  @override
  Future<String> patchCompleted(todo) {
    // TODO: implement patchCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(todo) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(todo) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
}