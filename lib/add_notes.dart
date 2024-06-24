import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app_flutter/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class add_notes extends StatefulWidget {
  const add_notes({super.key});

  @override
  State<add_notes> createState() => _add_notesState();
}

class _add_notesState extends State<add_notes> {
  //
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  //++
  List<Notes> list = [];
  //
  late SharedPreferences sharedPreferences;
  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList("list");
    if (stringList != null) {
      list =
          stringList.map((item) => Notes.fromMap(json.decode(item))).toList();
    }
  }

//
  @override
  void initState() {
    getData();
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 225, 142),
        centerTitle: true,
        title: Text("Add Notes"),
      ),
      body: ListView(
        children: [
          //1
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Color.fromARGB(255, 177, 177, 177), width: 2)),
            //
            child: Column(
              children: [
                TextField(
                  //
                  controller: title,

                  //
                  maxLines: 1,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: 'Title', border: InputBorder.none),
                ),
                //--
                TextField(
                  //
                  controller: description,
                  //
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description', border: InputBorder.none),
                ),
              ],
            ),
          ),
          //////222
          InkWell(
            onTap: () {
              list.insert(
                  0, Notes(title: title.text, description: description.text));
              List<String> stringList =
                  list.map((item) => json.encode(item.toMap())).toList();
              sharedPreferences.setStringList("list", stringList);
              // Navigator.pushNamed(context, 'notes');
              Navigator.pop(context, "loadData");
            },
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 232, 108),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Save",
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 119, 112), fontSize: 18),
              )),
            ),
          ),
          //
          SizedBox(
            height: 30,
          ),
          Container(
              height: 100, width: 200, child: Image.asset("assets/int2.png"))
        ],
      ),
    );
  }
}
