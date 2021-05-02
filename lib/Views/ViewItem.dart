import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Person.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewItem extends StatefulWidget {
  Item item = new Item();
  Function toggleParticipant;

  ViewItem(this.item, this.toggleParticipant, {Key key}) : super(key: key);

  @override
  _ViewItemState createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    nameController.text = widget.item.name;
    final priceController = TextEditingController();
    priceController.text = widget.item.price.toString();

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
                      trailing: person.selected
                          ? Icon(Icons.check)
                          : Container(child: Text("")),
                      onTap: () {
                        setState(() {
                          person.selected = !person.selected;
                        });
                        widget.toggleParticipant(widget.item, person);
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.item.name = nameController.text;
                },
                child: Text("Save changes"),
              ),
            ],
          ),
        ));
  }
}
