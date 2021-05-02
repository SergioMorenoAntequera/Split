import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Person.dart';
import 'package:bill_splitter/Models/Providers/ItemsList.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogAddItem extends StatefulWidget {
  DialogAddItem({Key key}) : super(key: key);

  @override
  _DialogAddPersoItem createState() => _DialogAddPersoItem();
}

class _DialogAddPersoItem extends State<DialogAddItem> {
  Item itemToAdd = Item();
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Name"),
            TextField(
              onChanged: (text) {
                itemToAdd.name =  text;
              },
            ),
            new Text("Price"),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                text = text.replaceAll(",", ".");
                itemToAdd.price = double.parse(text);
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
          child: Text('Add Item!'),
          onPressed: () {
            print(itemToAdd.price);
            Provider.of<ItemsList>(context, listen: false).addToList(itemToAdd);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
