import 'package:bill_splitter/Models/Participation.dart';
import 'package:bill_splitter/Models/Person.dart';

class Item {
  String name = "";
  double price = 0.0;

  List<Participation> participations = [];

  Item() {}
  Item.fromBasics(String name, double price) {
    this.name = name;
    this.price = price;
  }

  bool checkForParticipant(String nameToFind) {
    return this.participations.map((e) => e.person.name).contains(nameToFind);
  }
}
