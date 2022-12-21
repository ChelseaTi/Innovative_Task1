import 'package:flutter/material.dart';
import 'package:mid_prac/detailspage.dart';

  class HomePage extends StatefulWidget {

  const HomePage({Key?key}) : super(key: key);

  @override
  State<HomePage> createState () => _HomePageState();
}

  class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

    late TabController tabController;

    List <Student> student_list = [

      name = 'Chelsea',
      section = 'IT3R1',
      age = 29

    ];


    List <Group> group_list = [
      Group(
          groupName: "Section R5",
          type: "Learning Purposes"
      )
    ];

    @override
    void initState() {
      tabController = TabController(length: 2, vsync: this);
      super.initState();
    }

    @override
    Widget Build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page"),
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.group))
              ],
            )
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            students(student_list: student_list),
            groups(group_list: group_list)
          ],
        ),
      );
    }
  }