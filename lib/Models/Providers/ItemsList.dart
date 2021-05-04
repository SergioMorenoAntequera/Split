import 'package:bill_splitter/Models/Item.dart';
import 'package:bill_splitter/Models/Providers/MyList.dart';

class ItemsList extends MyList {
  List<Item> list;
  ItemsList(this.list) : super(list);
}
