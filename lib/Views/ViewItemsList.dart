import 'package:bill_splitter/Dialogs/DialogAddItem.dart';
import 'package:bill_splitter/Models/Providers/ItemsList.dart';
import 'package:bill_splitter/Views/ViewItem.dart';
import 'package:bill_splitter/Views/ViewPeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewItemsList extends StatefulWidget {
  ViewItemsList({Key key}) : super(key: key);

  @override
  _ViewItemsListState createState() => _ViewItemsListState();
}

class _ViewItemsListState extends State<ViewItemsList> {
  @override
  Widget build(BuildContext context) {
    var itemsList = Provider.of<ItemsList>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
        actions: [
          TextButton(
            onPressed: () { 
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewPeopleList()),
              );
              },
            child: Icon(Icons.person, color: Colors.white,),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: itemsList.list.length,
        itemBuilder: (context, index) {
          var item = itemsList.list[index];
          return ListTile(
            key: UniqueKey(),
            title: Text("${item.name}"),
            subtitle:
                Text("${item.participations.length.toString()} participants"),
            trailing: Text("${item.price.toString()}€"),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewItem(item)),
              ),
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        tooltip: 'Add new Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (_) => DialogAddItem(),
    );
  }
}
