import 'package:bill_splitter/Dialogs/DialogAddPerson.dart';
import 'package:bill_splitter/widgets/ItemList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewItemsList extends StatefulWidget {
  ViewItemsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewItemsListState createState() => _ViewItemsListState();
}

class _ViewItemsListState extends State<ViewItemsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ItemList(),

      
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPeopleDialog,
        tooltip: 'Add new Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddPeopleDialog() {
    
  }
}
