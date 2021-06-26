import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Participation.dart';
import 'package:bill_splitter/Models/Providers/ItemsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogAddPaid extends StatefulWidget {
  Participation particpation;
  Function updatePaid;

  DialogAddPaid(this.particpation, this.updatePaid, {Key key})
      : super(key: key);

  @override
  _DialogAddPaid createState() => _DialogAddPaid();
}

class _DialogAddPaid extends State<DialogAddPaid> {
  var value = 0.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Amount paid"),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  text = text.replaceAll(",", ".");
                  value = double.parse(text);
                });
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
          child: Text('Confirm!'),
          onPressed: () {
            print(value);
            setState(() {
              widget.updatePaid(
                widget.particpation,
                value,
              );
            });
            print(widget.particpation.paid);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
