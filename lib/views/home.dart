import 'dart:convert';
import 'dart:async';

import 'package:complexJsonParsing/models/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> loadPersonFromAssets() async {
    return await rootBundle.loadString("assets/person.json");
  }

  Person person;
  var jsonResponse;
  var name;

  Future loadPerson() async {
    String jsonString = await loadPersonFromAssets();
    jsonResponse = json.decode(jsonString);
    person = new Person.fromJson(jsonResponse);
    print("Name: ${person.name}");
    print("Age: ${person.age}");
    print("Places: ${person.places}");
    print("Images: ${person.images[0].id}");
    print("Images: ${person.images[1].name}");
    print("Address: ${person.address.details.town}");
    print("Address: ${person.address.streetNo}");
  }

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //     appBar: AppBar(
        //       title: Text("Complex Passing"),
        //     ),
        //     body: Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text("null"),
        //         ],
        //       ),
        //     ),
        );
  }
}
