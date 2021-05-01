import 'package:bill_splitter/Models/Item.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget{
  List<Item> items;
  UserList(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: UniqueKey(),
          title: Text("${items[index].name}"),
        );
      },
    );
  }
}
