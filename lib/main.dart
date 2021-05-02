import 'package:bill_splitter/Models/Providers/ItemsList.dart';
import 'package:bill_splitter/Models/Providers/PeopleList.dart';
import 'package:bill_splitter/Views/ViewItemsList.dart';
import 'package:bill_splitter/Views/ViewPeopleList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemsList([])),
        ChangeNotifierProvider(create: (context) => PeopleList([])),
      ],
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewItemsList(),
    );
  }
}

