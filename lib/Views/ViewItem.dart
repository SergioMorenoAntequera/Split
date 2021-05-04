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

    var auxAvailablePeople = Provider.of<PeopleList>(context, listen: false);
    var availablePeople = [];
    auxAvailablePeople.list.forEach((element) {
      availablePeople.add(element);
    });

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
            // The fucking lsit
            Container(
              alignment: Alignment.centerLeft,
              child: Text("People involved"),
              margin: EdgeInsets.only(top: 50),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                itemCount: availablePeople.length,
                itemBuilder: (context, index) {
                  var person = availablePeople[index];

                  return ListTile(
                    key: UniqueKey(),
                    title: Text("${person.name}"),
                    trailing: findParticipantInItem(person)
                        ? Icon(Icons.check)
                        : Container(child: Text("")),
                    onTap: () {
                      // setState(() {
                      //   person.selected = !person.selected;
                      // });
                      widget.toggleParticipant(widget.item, person);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool findParticipantInItem(Person participant) {
    widget.item.participations.forEach((participation) {
      if (participation.person.name == participant.name) {
        print("true");
        return true;
      }
    });
    print("false");
    return false;
  }
}
