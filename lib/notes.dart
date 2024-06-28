import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/add_notes.dart';
import 'package:notes_app_flutter/model.dart';
import 'package:notes_app_flutter/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notes extends StatefulWidget {
  const notes({super.key});

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  //

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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            String? refresh = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => add_notes(),
                ));
            if (refresh == "loadData") {
              setState(() {
                getData();
              });
            }
          }),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 215, 213, 213),
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
//
                    Get.to(settings());

//
                  },
                  icon: Icon(Icons.settings)),
              Divider(
                height: 100,
                color: Color.fromARGB(255, 255, 191, 0),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded)),
              Divider(
                height: 100,
                color: Color.fromARGB(255, 255, 191, 0),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.help)),
              Divider(
                height: 100,
                color: Color.fromARGB(255, 255, 191, 0),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 230, 166),
        centerTitle: true,
        title: Text("notes".tr),
      ),
//
      body: list.isEmpty
          ? Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("$index"),
                  ),
                  title: Text(list[index].title),
                  subtitle: Text(list[index].description),
                  //
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          list.remove(list[index]);
                        });
                        List<String> stringList = list
                            .map((item) => json.encode(item.toMap()))
                            .toList();
                        sharedPreferences.setStringList("list", stringList);
                      },
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.blue,
                      )),
                );
              },
            ),
    );
  }
}
