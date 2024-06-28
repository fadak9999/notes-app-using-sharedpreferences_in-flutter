import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_flutter/add_notes.dart';
import 'package:notes_app_flutter/introduction.dart';
import 'package:notes_app_flutter/language/locale.dart';
import 'package:notes_app_flutter/language/locale_controller.dart';
import 'package:notes_app_flutter/login.dart';
import 'package:notes_app_flutter/mode/modeProvider.dart';
import 'package:notes_app_flutter/mode/theme.dart';
import 'package:notes_app_flutter/notes.dart';
import 'package:notes_app_flutter/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  //?
  WidgetsFlutterBinding.ensureInitialized();
  //?
  runApp(ChangeNotifierProvider(
      create: (context) => ModeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //
    MyLocaleController controller = Get.put(MyLocaleController());

    //
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: controller.initialLang,
      translations: MyLocale(),

      //
      theme: Provider.of<ModeProvider>(context).lightModeEnable
          ? ModeTheme.lightMode
          : ModeTheme.darkMode,
      home: splash(),
      routes: {
        'introduction': (context) => const introduction(),
        'login': (context) => const login(),
        'add_notes': (context) => const add_notes(),
        'notes': (context) => const notes(),
      },
    );
  }
}
