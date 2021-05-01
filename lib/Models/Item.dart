
import 'dart:ffi';

import 'package:bill_splitter/Models/Person.dart';

class Item {

  String name = "";
  double price = 0.0;

  List<Person> peopleWhoPaidForIt = [];
  List<Person> peopleWhoWantIt = [];

  Item() {}
}