class Todo {
  String? lastName;

  Todo({this.lastName});

  Todo.fromJson(Map<String, dynamic> json) {
    lastName = json['LastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastName'] = this.lastName;
    return data;
  }
}
