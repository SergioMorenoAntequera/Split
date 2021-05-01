import 'package:bill_splitter/Widgets/UserList.dart';
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
  String newPersonName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: UserList(peopleAdded),
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
        builder: (_) => new AlertDialog(
              content: Container(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("Introduce the new person"),
                  TextField(
                    onChanged: (text) {
                      newPersonName = text;
                    },
                  ),
                ],
              ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Nah, passing'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Add person!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
