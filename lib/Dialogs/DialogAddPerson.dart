import 'package:bill_splitter/Models/Person.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogAddPerson extends StatefulWidget {
  DialogAddPerson({Key key}) : super(key: key);

  @override
  _DialogAddPersonState createState() => _DialogAddPersonState();
}

class _DialogAddPersonState extends State<DialogAddPerson> {
  String personToAdd = "";
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Introduce the new person"),
            TextField(
              onChanged: (text) {
                personToAdd =  text;
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
            Provider.of<PeopleList>(context, listen: false).addToList(Person.fromBasics(personToAdd));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
