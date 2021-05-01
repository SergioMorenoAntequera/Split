import 'package:flutter/material.dart';

class UserList extends StatelessWidget{
  List<String> people;
  UserList(this.people, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      itemCount: people.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: UniqueKey(),
          title: Text("${people[index]}"),
        );
      },
    );
  }
}
