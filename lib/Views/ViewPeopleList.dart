import 'package:bill_splitter/Dialogs/DialogAddPerson.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPeopleList extends StatefulWidget {
  ViewPeopleList({Key key}) : super(key: key);

  @override
  _ViewPeopleListState createState() => _ViewPeopleListState();
}

class _ViewPeopleListState extends State<ViewPeopleList> {
  @override
  Widget build(BuildContext context) {
    var peopleList = Provider.of<PeopleList>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text("People List")),
      body: ListView.builder(
        itemCount: peopleList.list.length,
        itemBuilder: (context, index) {
          var person = peopleList.list[index];
          return ListTile(
            title: Text("${person.name}"),
            trailing: TextButton(
              onPressed: () => {peopleList.removeFromList(person)},
              child: Icon(Icons.remove_circle),
            ),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPeopleDialog,
        tooltip: 'Add new people',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddPeopleDialog() {
    showDialog(
      context: context,
      builder: (_) => DialogAddPerson(),
    );
  }
}
