import 'package:flutter/material.dart';

class DialogAddPerson extends StatefulWidget {
  Function addPerson;
  DialogAddPerson(this.addPerson, {Key key}) : super(key: key);

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
            widget.addPerson(personToAdd);  
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
