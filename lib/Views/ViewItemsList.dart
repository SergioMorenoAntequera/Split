import 'package:bill_splitter/Dialogs/DialogAddItem.dart';
import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Participation.dart';
import 'package:bill_splitter/Models/Person.dart';
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
                context,
                MaterialPageRoute(builder: (context) => ViewPeopleList()),
              );
            },
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
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
                MaterialPageRoute(
                    builder: (context) => ViewItem(item, toggleParticipant)),
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

  void toggleParticipant(Item baseItem, Person personParticipating) {
    var newParticipation = Participation.fromPerson(personParticipating);

    setState(() {
      var found = baseItem.participations.firstWhere(
        (e) => e.person.name == personParticipating.name,
        orElse: () => Participation(),
      );
      if (found.person.name != "") {
        baseItem.participations.remove(found);
        return false;
      } else {
        baseItem.participations.add(newParticipation);
        return true;
      }
    });
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (_) => DialogAddItem(),
    );
  }
}
