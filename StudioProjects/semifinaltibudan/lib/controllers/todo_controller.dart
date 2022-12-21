import 'package:semifinaltibudan/repos/rep.dart';
import 'package:semifinaltibudan/mymodels/todo.dart';

  class TodoController {
    final Rep _rep;

  TodoController(this._rep);

  Future<Future<List>> fetchTodoList() async{
    return _rep.getTodoList();
    }
}