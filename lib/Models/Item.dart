
import 'dart:ffi';

import 'package:bill_splitter/Models/Person.dart';

class Item {

  String name = "";
  double price = 0.0;

  List<Person> payers = [];
  List<Person> participants = [];

  Item() {}
  Item.fromBasics(String name, double price) {
    this.name = name;
    this.price = price;
  }
}