import 'package:bill_splitter/Models/Person.dart';

class Participation {
  var person = new Person();
  var paid = 0.0;
  var toPay = 0.0;

  Participation();
  Participation.fromPerson(this.person);
}
