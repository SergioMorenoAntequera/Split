import 'package:bill_splitter/Models/Providers/ItemsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget{
  ItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemsList = Provider.of<ItemsList>(context, listen: true);
      
    return ListView.builder(
      itemCount: itemsList.list.length,
      itemBuilder: (context, index) {
        var item = itemsList.list[index];
        return ListTile(
          key: UniqueKey(),
          title: Text("${item.name}"),
          trailing: Text("${item.price.toString()}€"),
        );
      },
    );
  }
}
