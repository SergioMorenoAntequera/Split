import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewItem extends StatelessWidget {
  Item item = new Item();

  ViewItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    nameController.text = item.name;
    final priceController = TextEditingController();
    priceController.text = item.price.toString();

    var availablePeople = Provider.of<PeopleList>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text("Editing item"),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              
              Container(
                alignment: Alignment.centerLeft,
                child: Text("People involved"),
                margin: EdgeInsets.only(top: 50),
              ),
              Container(
                height: 200.0,
                child: ListView.builder(
                  itemCount: availablePeople.list.length,
                  itemBuilder: (context, index) {
                    var person = availablePeople.list[index];
                    return ListTile(
                      key: UniqueKey(),
                      title: Text("${person.name}"),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  item.name = nameController.text;
                  item.price =
                      double.parse(nameController.text.replaceAll(",", "."));
                  Navigator.pop(context);
                },
                child: Text("Save changes"),
              ),
            ],
          ),
        ));
  }
}
