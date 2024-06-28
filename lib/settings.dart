import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/language/locale_controller.dart';
import 'package:notes_app_flutter/mode/modeProvider.dart';
import 'package:provider/provider.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  //
  bool star = false;
  //
  @override
  Widget build(BuildContext context) {
    //
    MyLocaleController controllerllang = Get.find();
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("titleDrawer".tr),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              height: 100,
              child: Text("titleDrawer".tr)),
          ElevatedButton(
              onPressed: () {
                controllerllang.changeLang("ar");
              },
              child: Text("3".tr)),
          ElevatedButton(
              onPressed: () {
                controllerllang.changeLang("en");
              },
              child: Text("2".tr)),
          Divider(
            height: 100,
          ),
          SwitchListTile(
              title: Text("mod".tr),
              value: star,
              onChanged: (Value) {
                setState(() {
                  star = Value;
                });
                Provider.of<ModeProvider>(context, listen: false).chaneMode();
              })
        ],
      ),
    );
  }
}
