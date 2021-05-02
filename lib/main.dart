import 'package:bill_splitter/Dialogs/DialogAddPerson.dart';
import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Widgets/UserList.dart';
import 'package:bill_splitter/widgets/ItemList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> peopleAdded = ["heyasd", "hey qeu asd", "dasdada"];
  List<Item> allItems = [
    Item.fromBasics("cosa", 10),
    Item.fromBasics("cosa 2", 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ItemList(allItems),
      floatingActionButton: FloatingActionButton(
        // onPressed: _showAddPeopleDialog,
        onPressed: _showAddPeopleDialog,
        tooltip: 'Add new people',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddPeopleDialog() {
    showDialog(
      context: context,
      builder: (_) => DialogAddPerson(addPerson),
    );
  }

  void addPerson(personNameToAdd) {
    setState(() {
      peopleAdded.add(personNameToAdd);
    });
  }
}
