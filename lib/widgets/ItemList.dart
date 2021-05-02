import 'package:bill_splitter/Models/Item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget{
  List<Item> items;
  ItemList(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return ListTile(
          key: UniqueKey(),
          title: Text("${item.name}"),
          trailing: Text("${item.price.toString()}€"),
        );
      },
    );
  }
}
