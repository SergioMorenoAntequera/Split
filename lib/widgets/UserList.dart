import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  List<String> people;
  UserList(this.people, {Key key}) : super(key: key);
  
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  
  @override
  Widget build(BuildContext context) {
    var people = widget.people;

    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text("${people[index]}"),
        );
      },
    );
  }
}
