import 'package:bill_splitter/Models/Participation.dart';
import 'package:bill_splitter/Models/Person.dart';

class Item {
  String name = "";
  double price = 0.0;
  bool splitEvenly = true;

  List<Participation> participations = [];

  Item() {}
  Item.fromBasics(String name, double price) {
    this.name = name;
    this.price = price;
  }

  bool checkParticipant(String nameToFind) {
    return this.participations.map((e) => e.person.name).contains(nameToFind);
  }

  Participation checkParticipation(String personName) {
    Participation auxPercentage = Participation();
    this.participations.forEach((element) {
      if (element.person.name == personName) {
        auxPercentage = element;
      }
    });
    return auxPercentage;
  }

  void sharePrice() {
    if (!splitEvenly) return;
    var pricePerPerson = price / participations.length;
  }
}
