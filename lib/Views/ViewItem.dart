import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Participation.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewItem extends StatefulWidget {
  Item item = new Item();
  Function toggleParticipant;
  Function showAddPaidMoneyDialog;

  ViewItem(this.item, this.toggleParticipant, this.showAddPaidMoneyDialog,
      {Key key})
      : super(key: key);

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

    var peopleList = Provider.of<PeopleList>(context, listen: false);

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
            ElevatedButton(
              child: new Text('Split Evenly'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    widget.item.splitEvenly ? Colors.grey : Colors.blue),
              ),
              onPressed: () => setState(
                  () => widget.item.splitEvenly = !widget.item.splitEvenly),
            ),
            // The  lsit
            Container(
              alignment: Alignment.centerLeft,
              child: Text("People involved"),
              margin: EdgeInsets.only(top: 50),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                itemCount: peopleList.list.length,
                itemBuilder: (context, index) {
                  var person = peopleList.list[index];
                  return ListTile(
                    key: UniqueKey(),
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${person.name}"),
                          Row(
                            children: [
                              Text(
                                "${widget.item.checkParticipation(person.name).toPay}",
                                style: TextStyle(color: Colors.red),
                              ),
                              Container(width: 10),
                              Text(
                                "${widget.item.checkParticipation(person.name).paid}",
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: widget.item.checkParticipant(person.name)
                        ? Icon(Icons.check)
                        : Icon(Icons.clear_rounded),
                    onTap: () {
                      setState(() {
                        widget.toggleParticipant(widget.item, person);
                      });
                    },
                    onLongPress: () {
                      widget.showAddPaidMoneyDialog(
                        widget.item.checkParticipation(person.name),
                        updatePaid,
                      );
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

  void updatePaid(Participation participation, double moneyPaid) {
    setState(() {
      participation.paid = moneyPaid;
    });
  }
}
