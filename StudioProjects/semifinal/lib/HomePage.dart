import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:my_apptodo/posts_class.dart';
import 'package:my_apptodo/posts_edit.dart';
import 'package:my_apptodo/posts_forms.dart';
import 'package:my_apptodo/view_posts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
const String url = 'https://jsonplaceholder.typicode.com/todos';
class _HomePageState extends State<HomePage> {
  List _posts = <dynamic>[];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  Future<List> fetchTodo() async{
    var feedback = await http.get(Uri.parse(url));
    if(feedback.statusCode == 200){
      setState(() {
        _posts = convert.jsonDecode(feedback.body) as List<dynamic>;
      });
      return _posts;
    }
    else{
      throw Exception('Failed to fetch todo.');
    }
  }

  Future<List> deleteTodos(String id) async{
    var feedback = await http.delete(Uri.parse(url));
    if(feedback.statusCode == 200){
      setState(() {
        _posts = POSTS.fromJson(convert.jsonDecode(feedback.body)) as List<dynamic>;
      });
      return _posts;
    }
    else{
      throw Exception('Failed to delete todos.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.edit_note),
        backgroundColor: Colors.blue.shade700,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: const Card(
              color: Colors.grey,
              child: Icon(Icons.delete),
            ),
            onDismissed: (direction) => deleteTodos(_posts[index]["id"].toString()),
            child: Card(
              color: Colors.blue.shade50,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              elevation: 10,
              child: ListTile(
                title: Text(_posts[index]["title"]),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditToDo(edit: _posts[index], title: widget.title,))
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayTodo(todo: _posts[index], title: widget.title))
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTodo(title: widget.title,))
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
