import 'package:bill_splitter/Models/Person.dart';
import 'package:bill_splitter/Models/Providers/MyList.dart';

class PeopleList extends MyList {
  
  List<Person> list;
  PeopleList(this.list) : super(list);
} 