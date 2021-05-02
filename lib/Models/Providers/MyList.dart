import 'package:flutter/foundation.dart';

abstract class MyList with ChangeNotifier, DiagnosticableTreeMixin {
  
  List<dynamic> genericList;

  MyList(this.genericList);

  void addToList(elementToAdd){
    genericList.add(elementToAdd);
    notifyListeners();
  }

  void removeFromList(elementToRemove) {
    genericList.remove(elementToRemove);
    notifyListeners();
  }
}